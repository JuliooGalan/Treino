import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Treinamento flutter'),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(milliseconds: 1000),
          child: ListView(
            children: [
              Task(
                  'Treino',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgYK8Dh_X8-lPaHZ9dge371fUyD7ZToJAURw&usqp=CAU',
                  ),
              Task(
                  'Treino1',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgYK8Dh_X8-lPaHZ9dge371fUyD7ZToJAURw&usqp=CAU',
                  ),
              Task(
                  'Treino2',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgYK8Dh_X8-lPaHZ9dge371fUyD7ZToJAURw&usqp=CAU',
                  ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //setState fica de olho na mudança de estado, para mudar a tela do app necessita usá-lo
            setState(() {
              opacidade = !opacidade;
            });
            
          },
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  

  const Task(this.nome, this.foto, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int nivelValue = 10;
  List<bool> starStates = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey,
                        ),
                        width: 200,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    for (int i = 0; i <= index; i++) {
                                      starStates[i] = true;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  size: 15,
                                  color: starStates[index]
                                      ? Colors.blue
                                      : Colors.blue[100],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            if (nivel < nivelValue) {
                              setState(() {
                                nivel++;
                              });
                            }
                            print(nivel);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'Up',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.black,
                          value: nivel / nivelValue,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Nível $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
