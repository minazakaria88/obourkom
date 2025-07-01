part of 'home_cubit.dart';


 class HomeState extends Equatable {
  final int currentIndex;
  final List<bool> isVisited;
   const HomeState({required this.currentIndex,required this.isVisited});



   HomeState copyWith({
     int? currentIndex,
     List<bool>? isVisited
   }) {
     return HomeState(
       currentIndex: currentIndex ?? this.currentIndex,
       isVisited: isVisited ?? this.isVisited
     );
   }

  @override
  List<Object?> get props => [currentIndex,isVisited];
 }

