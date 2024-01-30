part of 'note_cubit.dart';


abstract class NoteState {}

final class NoteInitial extends NoteState {}
final class AddNewNote extends NoteState {}
final class AddToDone extends NoteState {}
final class AddToArchive extends NoteState {}
final class RemoveNote extends NoteState {}

class ChangeTaskTypeState extends NoteState {}

