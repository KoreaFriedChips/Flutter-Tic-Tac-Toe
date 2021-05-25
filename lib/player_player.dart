import 'package:flutter/material.dart';

class PlayerVPlayer extends StatefulWidget {
  @override
  _PlayerVPlayerState createState() => _PlayerVPlayerState();
}

class _PlayerVPlayerState extends State<PlayerVPlayer> {
  int p1 = 0, p2 = 0, p1Moves = 0, p2Moves = 0;
  String a = "", b = "", c = "", d = "", e = "", f = "", g = "", h = "", i = "";
  bool turnX = false,
      showP1 = false,
      showP2 = false,
      winP1 = false,
      winP2 = false,
      showTie = false;

  bool checkWinner() {
    if ((a == b && b == c && a != "") ||
        (d == e && e == f && d != "") ||
        (g == h && h == i && g != "")) {
      return true;
    } else if ((a == d && d == g && a != "") ||
        (b == e && e == h && h != "") ||
        (c == f && f == i && i != "")) {
      return true;
    } else if ((a == e && e == i && a != "") || (c == e && e == g && e != "")) {
      return true;
    } else {
      return false;
    }
  }

  void p1Win() {
    if (checkWinner() && turnX) {
      p1++;
      setState(() {
        showP1 = true;
      });
      winP1 = true;
    }
  }

  void p2Win() {
    if (checkWinner() && !turnX) {
      p2++;
      setState(() {
        showP2 = true;
      });
      winP2 = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player vs Player"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: showP1,
            child: Text(
              "Player 1 wins!",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
          ),
          Visibility(
            visible: showP2,
            child: Text(
              "Player 2 wins!",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
          ),
          Visibility(
            visible: showTie,
            child: Text(
              "Tie",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Player 1: $p1',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Player 2: $p2',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                          right: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (a.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? a = "X" : a = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$a',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: a == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                          right: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (b.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? b = "X" : b = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$b',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: b == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      width: 120,
                      height: 120,
                      child: FlatButton(
                        onPressed: () {
                          if (c.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? c = "X" : c = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$c',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: c == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                          right: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (d.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? d = "X" : d = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$d',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: d == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                          right: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (e.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? e = "X" : e = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$e',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: e == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (f.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? f = "X" : f = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$f',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: f == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (g.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? g = "X" : g = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$g',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: g == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (h.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? h = "X" : h = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$h',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: h == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      child: FlatButton(
                        onPressed: () {
                          if (i.length != 0 || winP1 || winP2) return;

                          turnX = !turnX;
                          turnX ? p1Moves++ : p2Moves++;
                          setState(() {
                            turnX ? i = "X" : i = "O";
                          });
                          p1Win();
                          p2Win();
                          if (p1Moves + p2Moves == 9 && !winP1 && !winP2) {
                            setState(() {
                              showTie = true;
                            });
                          }
                        },
                        child: Text(
                          '$i',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: i == "X" ? Colors.red : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      a = "";
                      b = "";
                      c = "";
                      d = "";
                      e = "";
                      f = "";
                      g = "";
                      h = "";
                      i = "";
                      showP1 = false;
                      showP2 = false;
                      winP1 = false;
                      winP2 = false;
                      p1Moves = 0;
                      p2Moves = 0;
                      showTie = false;
                    });
                  },
                  child: Text('Play Again'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
