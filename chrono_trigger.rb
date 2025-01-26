require "time"
require_relative 's3_rates_uploader'
require_relative 'json_fetcher'

# Quotes for each situation
execution_quotes = [
  "A gate has opened... and destiny unfolds!",
  "Executing the event... Let’s rewrite the timeline!",
  "The Epoch is in motion. Event triggered successfully.",
  "Time flows, and the action begins—mission engaged!",
  "Magus whispers: 'Let the darkness consume this event!' It’s happening now.",
  "Chrono and the team have sprung into action—your event is live!",
  "Ayla cheers: 'Let’s do this now! Action smash!'",
  "Frog draws his sword: 'For the honor of time itself!'",
  "Lucca exclaims: 'It’s showtime! Let the sparks fly!'",
  "Marle twirls her crossbow: 'Let’s make history, one more time!'",
  "Robo powers up: 'Executing program... bzzt... mission active!'",
  "Epoch leaps forward through the timestream—event underway.",
  "Magus smirks: 'This is the moment we’ve been waiting for...'",
  "Chrono raises his blade: 'Let’s do this!'",
  "Lucca presses a button: 'Engaging the mechanism. Event live!'",
  "Schala’s voice echoes: 'The gate opens... proceed carefully.'",
  "Frog: 'Time honors the bold. Let us act now!'",
  "Ayla roars: 'Time to go! Smash action now!'",
  "The winds of time roar to life—action has begun.",
  "Destiny shifts as the event unfolds before your eyes."
]

next_trigger_quotes = [
  "The clock ticks on... next trigger at %{time}.",
  "The timeline bends toward the next event at %{time}.",
  "Marle smiles: 'We’re on course. Next action: %{time}.'",
  "Epoch recalibrating—next stop: %{time}.",
  "Ayla grins: 'Me wait for %{time}. Then go smash event!'",
  "The gate glimmers faintly... next trigger at %{time}.",
  "Robo scans the horizon: 'Next checkpoint: %{time}.'",
  "Magus gazes into the distance: 'The moment comes... %{time} awaits.'",
  "Lucca checks her watch: 'Right on schedule for %{time}!'",
  "The winds of time carry whispers of the next event at %{time}.",
  "Frog adjusts his armor: 'We shall be ready at %{time}.'",
  "Epoch steadies itself in preparation for %{time}.",
  "Chrono silently waits for the perfect moment: %{time}.",
  "The pendulum swings... next destination: %{time}.",
  "Schala’s voice hums faintly: 'The moment draws near... %{time}.'",
  "Robo calculates: 'Timeline stable. Next event set for %{time}.'",
  "Marle adjusts her bow: 'Almost time... %{time} is the moment.'",
  "Lucca tightens a bolt: 'Keep an eye out! %{time} is the target.'",
  "Magus mutters: 'Soon... the plan aligns at %{time}.'",
  "The clock glows faintly, marking %{time} as the next divergence."
]

sleep_quotes = [
  "The timeline is steady. Resting until the next ripple...",
  "Robo hums a soft tune as the script waits for its next moment.",
  "All is quiet... the gate awaits its next activation.",
  "Magus mutters: 'Not yet. The time is not right...'",
  "Ayla stretches: 'Nothing to do now. Wait for action!'",
  "Epoch’s systems are idle, waiting for the stars to align.",
  "Lucca adjusts some settings and nods: 'Still on track.'",
  "Chrono sharpens his blade, preparing for the next event.",
  "Marle gazes at the horizon, waiting for the call to action.",
  "Frog meditates: 'Patience, for time is our ally...'",
  "Schala whispers from the ether: 'It’s not time yet. Hold steady...'",
  "The timeline flows undisturbed, waiting for its next divergence.",
  "Robo blinks: 'Bzzt... monitoring systems operational.'",
  "Epoch hovers silently, ready but at rest.",
  "A subtle breeze flows through the timeline. All is calm for now.",
  "The gate flickers faintly, but remains closed for now.",
  "The past and future are quiet, as the present takes a breath.",
  "A watchful eye on the clock... nothing stirs for the moment.",
  "The winds of time settle as the next moment looms in the distance.",
  "All is as it should be. Waiting for the call of the next adventure.",
  "The echoes of time are silent. Resting in the void...",
  "Magus closes his eyes briefly: 'The moment of action is yet to come.'",
  "The clock gears turn softly... nothing stirs for now.",
  "Frog sits by the fire, waiting for the call of duty.",
  "Epoch hums faintly, idling in the fabric of time.",
  "Lucca tinkers with her tools: 'Not yet... just a little longer.'",
  "Chrono leans against his sword, eyes scanning the horizon.",
  "The gate faintly shimmers but remains dormant for now.",
  "Ayla yawns: 'Me wait. Me ready when time come!'",
  "Marle adjusts her pendant, patiently watching over the timeline.",
  "The winds of time rest quietly, awaiting their next stirring.",
  "The stars above remain steady, as the timeline slumbers.",
  "Robo’s sensors remain alert: 'Monitoring timeline integrity...'",
  "Epoch stabilizes in the flow of time, drifting idly.",
  "Schala’s voice whispers faintly: 'Peaceful moments are precious...'",
  "Magus broods silently, his thoughts hidden as time stretches forward.",
  "The waves of time settle into calm ripples, all is quiet.",
  "Frog polishes his blade, awaiting the next challenge.",
  "Lucca adjusts her goggles: 'Still holding. All systems normal.'",
  "The pendulum swings gently, as the moment drifts closer.",
  "Chrono sharpens his focus, ready for the next opening.",
  "Marle hums softly: 'Not yet... but soon, I can feel it.'",
  "Robo’s optics dim slightly, conserving power until the call to action.",
  "Ayla looks to the horizon: 'Not time. But me ready when time come!'",
  "The flow of time steadies itself, undisturbed for now.",
  "Epoch idles, its systems purring softly in quiet anticipation.",
  "Magus’ cape swirls as he ponders: 'Patience. Time bends to my will.'",
  "A faint hum echoes as the script prepares for its next pulse of activity.",
  "The gates remain sealed, their energy conserving for the right moment.",
  "Robo: 'Bzzt... entering observation mode. Timeline remains stable.'"
]

failure_quotes = [
  "A black wind howls... the event couldn’t be triggered.",
  "Frog sighs: 'Our quest has met with failure this time...'",
  "Even Lucca couldn’t fix this. The event failed to start.",
  "Robo stammers: 'Error detected... bzzz... event execution unsuccessful.'",
  "Something’s not right. The time stream falters; event failed.",
  "Schala’s voice echoes: 'Forgive me, but the gate did not open as expected.'"
]

trigger_time = Time.now

while true
  print "#{Time.now.strftime("%H:%M:%S")}: "
  if Time.now >= trigger_time
    begin
      puts "#{execution_quotes.sample}"
      upload_file(update_currency_rates)
    rescue Exception => e
      puts "#{failure_quotes.sample}"
      puts "#{e.message}"
    ensure
      trigger_time = Time.now + 14400
      puts "#{next_trigger_quotes.sample % {time: trigger_time.strftime("%H:%M")}}"
    end
  else
    puts "#{sleep_quotes.sample}"
  end
  puts
  sleep(900)
end
