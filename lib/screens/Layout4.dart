import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic/Parts/SudokuSolver.dart';



class Layout4 extends StatelessWidget {
  @override
  Future<void> _showMyDialog(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pause'),
            actions: <Widget>[
              FlatButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.keyboard_backspace),
              onPressed: (){
                Navigator.pop(context);
              }),
          title: Text("TaS"),
          backgroundColor: Colors.grey[400],
          actions:<Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    icon:Icon(
                      Icons.brightness_6,
                      size: 26.0,
                    ),
                    onPressed: (){}
                )
            ),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    icon:Icon(
                      Icons.pause,
                      size: 26.0,
                    ),
                    onPressed: () async {
                      _showMyDialog(context);
                    }
                )
            ),

            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    icon:Icon(
                      Icons.settings,
                      size: 26.0,
                    ),
                    onPressed: (){}
                )
            ),

          ]

      ),
      body: SudokuSolverPage(),
    );
  }
}

class SudokuSolverPage extends StatefulWidget {
  @override
  _SudokuSolverPageState createState() => _SudokuSolverPageState();
}

class _SudokuSolverPageState extends State<SudokuSolverPage> {
  List<int> _activeNumber = [0];

  List<List<int>> _board = List.generate(9, (_) => List.generate(9, (_) => 0));
  final solver = SudokuSolver();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SudokuBoard(_board,_activeNumber),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: KeyPad(_activeNumber),
            ),
          ),
          Expanded(
            flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                      child: RaisedButton(
                        padding: EdgeInsets.all(10),
                          child:Text('Solve') ,
                          onPressed: (){
                            debugPrint('Solving Board');
                            setState(() {
                              //solver.solveSudoku(this._board);
                            });
                          },
                      )
                  ),
                  Expanded(
                      flex: 5,
                      child: RaisedButton(
                        child:Text('Reset') ,
                        onPressed: (){
                          debugPrint('Reset Board');
                          setState(() {
                            //_resetBoard();
                          });
                        },
                      )
                  ),
                ],

              )
          )

        ]
    );
  }
}


class SudokuBoard extends StatelessWidget {
  final List<List<int>> board;
  final List<int> activeNumber;

  SudokuBoard(this.board, this.activeNumber);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        left: BorderSide(width: 3.0,color: Colors.black),
          top: BorderSide(width: 3.0,color: Colors.black)
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _getTableRows(),
    );
  }

  List<TableRow> _getTableRows(){
    return List.generate(9, (int rowNumber){
      return TableRow(children: _getRow(rowNumber));
    });
  }

  List<Widget> _getRow(int rowNumber){
    return List.generate(9, (int colNumber) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: (colNumber % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: (rowNumber % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
          ),
        ),
        child: SudokuCell(rowNumber, colNumber, this.board, this.activeNumber),
      );
    });
  }
}

class SudokuCell extends StatefulWidget {

  final int row, col;
  final List<List<int>> board;
  final List<int> activeNumber;

  SudokuCell(this.row, this.col, this.board, this.activeNumber);

  @override
  _SudokuCellState createState() => _SudokuCellState();
}

class _SudokuCellState extends State<SudokuCell> {
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      enableFeedback: true,
      onTap: (){
        setState(() {
          this.widget.board[this.widget.row][this.widget.col] =
          this.widget.activeNumber[0];
          _lights=true;
        });
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          color: _lights ? Colors.yellow.shade600 : Colors.white,
            child: Text(this.widget.board[this.widget.row][this.widget.col] == 0
                ? ''
                : this.widget.board[this.widget.row][this.widget.col].toString()),

        ),
      ),
    );
  }
}


class KeyPad extends StatelessWidget {
  final int numRows=2;
  final int numCol =5;

  final List<int> activeNumber;

  KeyPad(this.activeNumber);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black,
        style: BorderStyle.solid,
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _getTableRows(),
    );
  }

  List<TableRow>_getTableRows(){
    return List.generate(this.numRows, (int rowNumber){
      return TableRow(children: _getRow(rowNumber));
    });
  }
  List<Widget> _getRow(int rowNumber){
    return List.generate(this.numCol, (int colNumber) {
      return Padding(
        padding: EdgeInsets.all(5),
        child: KeyPadCell(
            this.numCol * rowNumber + colNumber, this.activeNumber),
      );
    });
  }

}
class KeyPadCell extends StatelessWidget {
  final int number;
  final List<int> activeNumber;
  KeyPadCell(this.number, this.activeNumber);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 40,
      child: FlatButton(

          color:Colors.brown,
          onPressed: (){
       final String message = this.number == 0
          ? 'Use to clear squares'
          : 'Fill all squares with value $number';
        Scaffold.of(context).hideCurrentSnackBar();
         duration: Duration(seconds: 1);
        this.activeNumber[0] = this.number;

          },
          child: Text('$number',
          style: TextStyle(
            fontSize: 30
          ),

          )
      ),
    );
  }
}



