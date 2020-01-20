import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinemoji_app/src/domain/entities/number_trivia.dart';
import 'package:pinemoji_app/src/presentation/blocs/bloc.dart';
import 'package:pinemoji_app/src/presentation/blocs/number_trivia_bloc.dart';
import '../../injection_container.dart';
import '../widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              //Top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                  builder: (context, state) {
                // return widget here based on BlocA's state
                if (state is Empty) {
                  return MessageDisplay(
                    message: 'Start searching!',
                  );
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  return TriviaDisplay(
                    numberTrivia: state.trivia,
                  );
                } else if (state is Error) {
                  return MessageDisplay(
                    message: state.message,
                  );
                } else
                  return Container();
              }),
              SizedBox(
                height: 20.0,
              ),
              //Bottom half
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}

