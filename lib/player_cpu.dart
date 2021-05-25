import 'dart:math';

import 'package:flutter/material.dart';

class PlayerVCPU extends StatefulWidget {
  @override
  _PlayerVCPUState createState() => _PlayerVCPUState();
}

class _PlayerVCPUState extends State<PlayerVCPU> {
  int p1 = 0, p2 = 0, cpuMove, playerMoves = 0, cpuMoves = 0;
  String a = "", b = "", c = "", d = "", e = "", f = "", g = "", h = "", i = "";
  bool turnX = false,
      showP1 = false,
      showP2 = false,
      showCPUMove = false,
      showTie = false,
      winP1 = false,
      winP2 = false;
  Random rd = new Random();

  bool checkWinner() {
    if ((a == b && b == c && a != "") ||
        (d == e && e == f && d != "") ||
        (g == h && h == i && g != "")) {
      showCPUMove = false;
      return true;
    } else if ((a == d && d == g && a != "") ||
        (b == e && e == h && h != "") ||
        (c == f && f == i && i != "")) {
      showCPUMove = false;
      return true;
    } else if ((a == e && e == i && a != "") || (c == e && e == g && e != "")) {
      showCPUMove = false;
      return true;
    } else {
      return false;
    }
  }

  void p1Win() {
    if (playerMoves + cpuMoves == 9) {
      showTie = true;
    }

    if (checkWinner() && turnX) {
      p1++;
      setState(() {
        showP1 = true;
      });
      winP1 = true;
    }
  }

  void p2Win() {
    if (playerMoves + cpuMoves == 9) {
      showTie = true;
    }
    if (checkWinner() && !turnX) {
      p2++;
      setState(() {
        showP2 = true;
      });
      winP2 = true;
    }
  }

  void cpuPlace() {
    if (playerMoves + cpuMoves != 9) {
      cpuMove = rd.nextInt(10);
      bool flag = true;
      while (flag) {
        if (cpuMove == 0)
          cpuMove = rd.nextInt(10);
        else if ((cpuMove == 1 && a == "") ||
            (cpuMove == 2 && b == "") ||
            (cpuMove == 3 && c == ""))
          flag = false;
        else if ((cpuMove == 4 && d == "") ||
            (cpuMove == 5 && e == "") ||
            (cpuMove == 6 && f == ""))
          flag = false;
        else if ((cpuMove == 7 && g == "") ||
            (cpuMove == 8 && h == "") ||
            (cpuMove == 9 && i == ""))
          flag = false;
        else
          cpuMove = rd.nextInt(10);
      }
      cpuMoves++;
      setState(() {
        showCPUMove = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player vs CPU"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: showP1,
            child: Text(
              "Player wins!",
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
              "CPU wins!",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
          ),
          Visibility(
            visible: showCPUMove,
            child: Text(
              "CPU moves $cpuMove",
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
                  'Player: $p1',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'CPU: $p2',
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
                          setState(() {
                            turnX ? a = "X" : a = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                          setState(() {
                            turnX ? b = "X" : b = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                          setState(() {
                            turnX ? c = "X" : c = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                          setState(() {
                            turnX ? d = "X" : d = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                          setState(() {
                            turnX ? e = "X" : e = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                          setState(() {
                            turnX ? f = "X" : f = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                          setState(() {
                            turnX ? g = "X" : g = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                          setState(() {
                            turnX ? h = "X" : h = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                          setState(() {
                            turnX ? i = "X" : i = "O";
                            if (turnX) showCPUMove = false;
                          });
                          if (turnX) playerMoves++;

                          p1Win();
                          if (turnX && !winP1) {
                            cpuPlace();
                          }
                          p2Win();
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
                      showCPUMove = turnX;
                      showTie = false;
                      playerMoves = 0;
                      cpuMoves = 0;
                      winP1 = false;
                      winP2 = false;
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
