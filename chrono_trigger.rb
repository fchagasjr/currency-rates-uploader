require "time"

# Quotes for each situation
class Quotes
  def self.execution_quote
    quotes =
      [
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

      "#{Time.now.strftime("%H:%M:%S")}: #{quotes.sample}"
  end

  def self.next_trigger_quote(time)
    time_string = time.strftime("%H:%M")
    quotes =
      [
        "The clock ticks on... next trigger at #{time_string}.",
        "The timeline bends toward the next event at #{time_string}.",
        "Marle smiles: 'We’re on course. Next action: #{time_string}.'",
        "Epoch recalibrating—next stop: #{time_string}.",
        "Ayla grins: 'Me wait for #{time_string}. Then go smash event!'",
        "The gate glimmers faintly... next trigger at #{time_string}.",
        "Robo scans the horizon: 'Next checkpoint: #{time_string}.'",
        "Magus gazes into the distance: 'The moment comes... #{time_string} awaits.'",
        "Lucca checks her watch: 'Right on schedule for #{time_string}!'",
        "The winds of time carry whispers of the next event at #{time_string}.",
        "Frog adjusts his armor: 'We shall be ready at #{time_string}.'",
        "Epoch steadies itself in preparation for #{time_string}.",
        "Chrono silently waits for the perfect moment: #{time_string}.",
        "The pendulum swings... next destination: #{time_string}.",
        "Schala’s voice hums faintly: 'The moment draws near... #{time_string}.'",
        "Robo calculates: 'Timeline stable. Next event set for #{time_string}.'",
        "Marle adjusts her bow: 'Almost time... #{time_string} is the moment.'",
        "Lucca tightens a bolt: 'Keep an eye out! #{time_string} is the target.'",
        "Magus mutters: 'Soon... the plan aligns at #{time_string}.'",
        "The clock glows faintly, marking #{time_string} as the next divergence."
      ]

      "#{Time.now.strftime("%H:%M:%S")}: #{quotes.sample}"
  end

  def self.sleep_quote
    quotes =
      [
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

    "#{Time.now.strftime("%H:%M:%S")}: #{quotes.sample}"
  end

  def self.failure_quote
    quotes =
      [
      "A black wind howls... the event couldn’t be triggered.",
      "Frog sighs: 'Our quest has met with failure this time...'",
      "Even Lucca couldn’t fix this. The event failed to start.",
      "Robo stammers: 'Error detected... bzzz... event execution unsuccessful.'",
      "Something’s not right. The time stream falters; event failed.",
      "Schala’s voice echoes: 'Forgive me, but the gate did not open as expected.'"
      ]

      "#{Time.now.strftime("%H:%M:%S")}: #{quotes.sample}"
  end
end

class Integer
  def minutes
    self * 60
  end

  def hours
    self * 3600
  end

  def days
    self * 86400
  end
end

class ChronoTrigger
  attr_reader :trigger_frequency, :sleep_time

  def initialize(trigger_frequency: 1.hour, sleep_time: 15.minutes)
    @trigger_frequency = trigger_frequency
    @sleep_time = sleep_time
  end

  def start(&block)
    trigger_time = Time.now

    while true
      if Time.now >= trigger_time
        begin
          puts "#{Quotes.execution_quote}"
          block.call
        rescue Exception => e
          puts "#{Quotes.failure_quote}"
          puts "#{e.message}"
        ensure
          trigger_time = Time.now + trigger_frequency
          puts "#{Quotes.next_trigger_quote(trigger_time)}}"
        end
      else
        puts "#{Quotes.sleep_quote}"
      end
      puts
      sleep(sleep_time)
    end
  end
end
