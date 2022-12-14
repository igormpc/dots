(
s.reboot {
	s.options.numBuffers = 1024 * 256;
	s.options.numWireBufs = 1024 * 8;
	s.options.memSize = 8192 * 64;
	s.options.numWireBufs = 64;
	s.options.maxNodes = 1024 * 32;
	s.options.maxSynthDefs = 10000;

	s.options.numOutputBusChannels = 8;
	s.options.numInputBusChannels = 2;

	s.options.maxLogins = 8;
	s.options.bindAddress = "0.0.0.0";

	s.recSampleFormat = "int24";
	s.recHeaderFormat = "wav";
	s.recChannels = 2;

    //  s.waitForBoot {
    // 	~dirt = SuperDirt(2, s);
    // 	~dirt.doNotReadYet = true;
    // 	~dirt.loadSoundFiles;
    // 	~dirt.loadSoundFiles("/home/igor/.local/share/SuperCollider/Extensions/samples-extra/*");
    // 	s.sync;
    // 	~dirt.start(57120, 0 ! 12, NetAddr("0.0.0.0"));
    // 	~dirt.start(57120, [0, 2, 4, 6], NetAddr("0.0.0.0"));
    //  Troop.start;
    //  Flok.start;
    //  QtGUI.palette_(QPalette.dark);
    // };
    };

    // scnvim
    if (\SCNvim.asClass.notNil) {
    Server.default.doWhenBooted {
        \SCNvim.asClass.updateStatusLine(1, \SCNvim.asClass.port);
    }
    }
)
