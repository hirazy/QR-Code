import 'package:equatable/equatable.dart';

// abstract class FlashState extends Equatable{
//   const FlashState();
//
//   List<Object> get props => throw UnimplementedError();
// }
//
// class FlashStateInitial extends FlashState {}
// class CommentStateFailure extends FlashState {}
//
// class FlashStateSuccess extends FlashState {
//   final List<Comment> comments;
//   final bool hasReachedEnd;
//   const CommentStateSuccess({this.comments, this.hasReachedEnd});
//   @override
//   String toString() => "comments : $comments, hasReachedEnd: $hasReachedEnd";
//   @override
//   // TODO: implement props
//   List<Object> get props => [comments, hasReachedEnd];
//   CommentStateSuccess cloneWith({
//     List<Comment> comments,
//     bool hasReachedEnd}) {
//     return CommentStateSuccess(
//         comments: comments ?? this.comments,
//         hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd
//     );
//   }
// }