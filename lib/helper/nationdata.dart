import 'package:newsapp/model/Nations_model.dart';

List<NationsModel> getNations() {
  List<NationsModel> nation = new List<NationsModel>();
  NationsModel nationsModel = new NationsModel();

  //1
  nationsModel = new NationsModel();
  nationsModel.nationsName = "USA";
  nationsModel.nationsURL =
      "https://images.pexels.com/photos/1093645/pexels-photo-1093645.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
  nation.add(nationsModel);

  //2
  nationsModel = new NationsModel();
  nationsModel.nationsName = "India";
  nationsModel.nationsURL =
      "https://images.pexels.com/photos/3699921/pexels-photo-3699921.jpeg?cs=srgb&dl=pexels-still-pixels-3699921.jpg&fm=jpg";
  nation.add(nationsModel);

  //3
  nationsModel = new NationsModel();
  nationsModel.nationsName = "China";
  nationsModel.nationsURL =
      "https://images.pexels.com/photos/1486577/pexels-photo-1486577.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  nation.add(nationsModel);

  //4
  nationsModel = new NationsModel();
  nationsModel.nationsName = "Australia";
  nationsModel.nationsURL =
      "https://images.pexels.com/photos/2193300/pexels-photo-2193300.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  nation.add(nationsModel);

  //5
  nationsModel = new NationsModel();
  nationsModel.nationsName = "New Zealand";
  nationsModel.nationsURL =
      "https://images.pexels.com/photos/2030683/pexels-photo-2030683.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  nation.add(nationsModel);

  //5
  nationsModel = new NationsModel();
  nationsModel.nationsName = "Russia";
  nationsModel.nationsURL =
      "https://images.pexels.com/photos/236294/pexels-photo-236294.jpeg?cs=srgb&dl=pexels-pixabay-236294.jpg&fm=jpg";
  nation.add(nationsModel);

  //5
  nationsModel = new NationsModel();
  nationsModel.nationsName = "South Korea";
  nationsModel.nationsURL =
      "https://images.pexels.com/photos/2849042/pexels-photo-2849042.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  nation.add(nationsModel);

  nationsModel = new NationsModel();

  return nation;
}
