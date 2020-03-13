/// @description Insert description here
// You can write your code in this editor

if (talk) {
	myText[0]    = "Omelete"
	mySpeaker[0] = self;
	myText[1]    = "Hum...";
	mySpeaker[1] = obj_player;

	create_dialogue(myText, mySpeaker);
	talk = false;
}