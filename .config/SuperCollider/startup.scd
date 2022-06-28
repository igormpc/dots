/*

        \                           /
         \                         /
          \                       /
           ]                     [    ,'|
           ]                     [   /  |
           ]___               ___[ ,'   |
           ]  ]\             /[  [ |:   |
           ]  ] \           / [  [ |:   |
           ]  ]  ]         [  [  [ |:   |
           ]  ]  ]__     __[  [  [ |:   |
           ]  ]  ] ]\ _ /[ [  [  [ |:   |
           ]  ]  ] ] (#) [ [  [  [ :===='
           ]  ]  ]_].nHn.[_[  [  [
           ]  ]  ]  HHHHH. [  [  [
           ]  ] /   `HH("N  \ [  [
           ]__]/     HHH  "  \[__[
           ]         NNN         [
           ]         N/"         [
           ]         N H         [
          /          N            \
         /           q,            \
        /                           \


*/

(
s.reboot {
	s.options.numBuffers = 1024 * 256;
	s.options.memSize = 8192 * 64;
	s.options.numWireBufs = 64;
	s.options.maxNodes = 1024 * 32;
	
  s.options.numOutputBusChannels = 18;
	s.options.numInputBusChannels = 14;
  
  s.options.maxLogins = 8;
	s.options.bindAddress = "0.0.0.0";
  
  s.recChannels = 2;
  s.recHeaderFormat = "wav";
  s.recSampleFormat = "float";
	
  s.waitForBoot {
		~dirt = SuperDirt(2, s);
		~dirt.doNotReadYet = true;

		~dirt.loadSoundFiles;
		~dirt.loadSoundFiles("/home/igor/.local/share/SuperCollider/Extensions/samples-extra/*");

		s.sync;
		~dirt.start(57120, 0 ! 12, NetAddr("0.0.0.0"));
		//~dirt.start(57120, [0, 2, 4, 6], NetAddr("0.0.0.0"));

		//Troop.start;
	};

	//QtGUI.palette = QPalette.dark;
	//s.latency = 0.3; // increase this if you get "late" messages

};
)
