(
s.reboot {
	s.options.numBuffers = 1024 * 256;
	s.options.numWireBufs = 1024 * 8;
	s.options.memSize = 8192 * 64;
	s.options.maxNodes = 1024 * 32;
	s.options.maxSynthDefs = 10000;

	s.options.numOutputBusChannels = 8;
	s.options.numInputBusChannels = 2;

	s.options.maxLogins = 8;
	s.options.bindAddress = "0.0.0.0";

	s.recChannels = 2;

	s.waitForBoot {
		// MIDIClient.init;
		// MIDIIn.connectAll;

		// ~midiOut = MIDIOut.newByName("USB Midi", "USB Midi MIDI 1");
		// ~midiOut = MIDIOut.newByName("Launchpad Pro 15", "Launchpad Pro 15 MIDI Port");
		// ~midiOut = MIDIOut(0, MIDIClient.destinations[index].uid);
		// ~midiOut.latency = 0.0;
		~dirt = SuperDirt(2, s);
		// ~dirt = SuperDirt(4, s);
		//~dirt.doNotReadYet = true;
		~dirt.loadSoundFiles;
		// ~dirt.postSampleInfo
		~dirt.loadSoundFiles("/home/igor/.local/share/SuperCollider/Extensions/samples-extra/*");
		~dirt.loadSoundFiles("/home/igor/.local/share/SuperCollider/Extensions/extra-samples/*");
		~dirt.loadSoundFiles("/home/igor/.local/share/SuperCollider/Extensions/custom_samples/*");
		~dirt.loadSoundFiles("/home/igor/.local/share/SuperCollider/Extensions/is/*");

		s.sync;
		~dirt.start(57120, 0 ! 12, NetAddr("0.0.0.0"));
		// ~dirt.start(57120, [0, 0, 0, 0], NetAddr("0.0.0.0"));
		// ~dirt.start(57120, [0, 2, 4, 6], NetAddr("0.0.0.0"));
		// ~dirt.soundLibrary.addMIDI(\midi, ~midiOut);
		~dirt.startSendRMS;

        // Initialize the TidalLooper
        ~looper = TidalLooper(~dirt);

        // You can adjust these parameter even in runtime
		~looper.rLevel = 0.85;
		~looper.pLevel = 0.8;
		// ~looper.linput = 15; // Set this to your main input port.
		// ~looper.lname = "mybuffer";

		// Troop.start;
		 Flok.start;
		// QtGUI.palette_(QPalette.dark);
		load("/home/igor/docs/tidal/tidal-synthdefs.scd");
	};
    };

    // scnvim
    if (\SCNvim.asClass.notNil) {
    Server.default.doWhenBooted {
        \SCNvim.asClass.updateStatusLine(1, \SCNvim.asClass.port);
    }
    }
)
