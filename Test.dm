Event/TestEvent
	fire()
		..()
		world << "Fired!"

client
	verb
		Schedule_Then_Cancel()
			var/EventScheduler/scheduler = new()
			scheduler.start()
			var/Event/E = new/Event/TestEvent()
			var/Event/F = new/Event/TestEvent()
			scheduler.schedule(E, 10)
			scheduler.schedule(F, 100)
			world << "Cancelling"
			scheduler.cancel(E)

		Schedule_Massacre()
			var/EventScheduler/scheduler = new()
			scheduler.start()
			for (var/A in 1 to 10000)
				scheduler.schedule(new/Event/Timer(scheduler, rand(100)), rand(10))