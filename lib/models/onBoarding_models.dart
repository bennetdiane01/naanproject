class onBoardingModel {
  String? image;
  String? title;
  String? text;

  onBoardingModel({this.image,this.text,this.title});
}

List<onBoardingModel> contents =[
  onBoardingModel(
      image: 'assets/images/3.png',
      title: '11.3% of the population is hungry',
      text: 'That’s rough 805 million people who_we_are go undernourished on a daily basis, consuming less than the recommended 2,100 calories a day.'
  ),
  onBoardingModel(
      image: 'assets/images/1.png',
      title: '1/3 of the world’s food was lost or wasted',
      text: 'For millions of people in low-income countries or the homeless, this lost  food can be a meal.'
  ),
  onBoardingModel(
      image: 'assets/images/2.png',
      title: '0.5\$ dollar can provide one meal',
      text: 'With your help, engagement, and volunteering, we can reach zero hunger in the world.'
  ),

];