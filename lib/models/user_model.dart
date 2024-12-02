class UserModel{
  final String vid;
  final String name;
  final String email;
  final String year;
  final String subject;
  final String grade;
  final String totalClasses;
  final String presents;
  final String absents;
  final String percentage;

  UserModel(this.vid, this.name, this.email, this.year, this.subject, this.grade, this.totalClasses, this.presents, this.absents, this.percentage);
  Map<String,dynamic>toJson()=>{
    'vid':vid,
    'name':name,
    'email':email,
    'year':year,
    'subject':subject,
    'grade':grade,
    'totalClasses':totalClasses,
    'presents':presents,
    'absents':absents, 
    'percentage':percentage
  };
}