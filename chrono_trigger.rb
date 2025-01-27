require "time"

# Quotes for each situation
class Quotes
  def self.execution_quotes
    [
      {
        start: "Chrono raises his blade high: 'Let’s start this!'",
        finish: "Chrono lowers his blade: 'It’s done. The path is clear.'",
        failure: -> (error) { "Chrono falters mid-swing, his grip trembling: 'The strike didn’t land. The shadows whisper of an error: \"#{error.message}\".'" }
      },
      {
        start: "Lucca powers up her contraption: 'Initiating the sequence!'",
        finish: "Lucca wipes her goggles: 'Sequence complete! Everything’s working perfectly.'",
        failure: -> (error) { "Lucca slaps her machine, sparks flying: 'The system’s malfunctioned! Error detected: \"#{error.message}\". I’ll recalibrate it.'" }
      },
      {
        start: "Marle steadies her crossbow: 'The moment is here!'",
        finish: "Marle smiles with relief: 'That’s a bullseye!'",
        failure: -> (error) { "Marle lowers her crossbow with a sigh: 'I missed... something’s off. Error: \"#{error.message}\". I’ll try again soon.'" }
      },
      {
        start: "Frog raises the Masamune: 'Let us strike with honor and valor!'",
        finish: "Frog sheathes the Masamune: 'The deed is done. Honor and time are preserved.'",
        failure: -> (error) { "Frog kneels solemnly, the Masamune trembling in his hands: 'T’is ill fortune. The strike hath failed us. Error: \"#{error.message}\".'" }
      },
      {
        start: "Magus glances to the sky: 'The gears of fate are in motion now.'",
        finish: "Magus folds his arms: 'The outcome is clear. Let us proceed.'",
        failure: -> (error) { "Magus glares into the void, his voice low: 'The threads of destiny slip from my grasp. Error: \"#{error.message}\". Fate resists me... for now.'" }
      },
      {
        start: "Ayla shouts: 'Me start smash now!'",
        finish: "Ayla cheers: 'Smash done! Me ready for next one!'",
        failure: -> (error) { "Ayla groans, frustrated: 'Smash no work. Error say: \"#{error.message}\". Ayla fix and try again!'" }
      },
      {
        start: "Robo activates his systems: 'Executing command protocol...'",
        finish: "Robo powers down slightly: 'Command executed. Awaiting next input.'",
        failure: -> (error) { "Robo’s circuits flicker, a faint whir escaping: 'Critical error detected: \"#{error.message}\". Systems need recalibration.'" }
      },
      {
        start: "Epoch charges its engines: 'Time to break the barrier!'",
        finish: "Epoch settles back into the timestream: 'Barrier broken. Ready for the next jump.'",
        failure: -> (error) { "Epoch halts mid-flight, systems flickering: 'Temporal jump failed. Error: \"#{error.message}\". Recalibrating coordinates.'" }
      },
      {
        start: "Schala’s voice echoes softly: 'The journey begins...'",
        finish: "Schala’s voice fades gently: 'The task is complete. You’ve done well.'",
        failure: -> (error) { "Schala’s voice trembles, filled with sorrow: 'The path is obstructed... Error: \"#{error.message}\". We must find another way.'" }
      },
      {
        start: "The gates of time shimmer: 'Opening the path to destiny...'",
        finish: "The gates of time close softly: 'The timeline is stable once more.'",
        failure: -> (error) { "The gates of time flicker violently: 'The path resists us. Error: \"#{error.message}\". The way remains sealed.'" }
      },
      {
        start: "Chrono grips his katana tightly: 'It’s time to change history!'",
        finish: "Chrono breathes deeply: 'History has been altered. We press on.'",
        failure: -> (error) { "Chrono stumbles backward, sweat on his brow: 'I couldn’t cut through... Error: \"#{error.message}\". Time holds firm, but we’ll try again.'" }
      },
      {
        start: "Lucca adjusts her goggles: 'Let’s see how this works... firing it up!'",
        finish: "Lucca grins: 'Everything’s functioning perfectly! Science prevails!'",
        failure: -> (error) { "Lucca groans, steam hissing from the machine: 'The experiment failed. Error: \"#{error.message}\". Back to the drawing board!'" }
      },
      {
        start: "Marle spins around: 'Alright, it’s action time!'",
        finish: "Marle nods triumphantly: 'Target hit, mission accomplished!'",
        failure: -> (error) { "Marle frowns, lowering her crossbow: 'That didn’t go as planned... Error: \"#{error.message}\". Let’s regroup.'" }
      },
      {
        start: "Frog kneels before the Masamune: 'By mine blade and thy honor, we shall triumph!'",
        finish: "Frog bows solemnly: 'T’is done. May the flow of time endure unbroken.'",
        failure: -> (error) { "Frog looks skyward, his voice heavy: 'T’is a grievous failure... Error: \"#{error.message}\". Our time shall come anon.'" }
      },
      {
        start: "Magus whispers darkly: 'It begins, just as I foretold.'",
        finish: "Magus sneers: 'Fate bends to my will. Let us continue.'",
        failure: -> (error) { "Magus turns away, shadows swirling around him: 'The future defies me this time. Error: \"#{error.message}\". But destiny is not yet written.'" }
      },
      {
        start: "Ayla pounds her fists together: 'Ayla strong! Time to go!'",
        finish: "Ayla laughs loudly: 'Action finished! Ayla strong AND done!'",
        failure: -> (error) { "Ayla scowls, slamming the ground: 'No work this time. Error: \"#{error.message}\". Ayla fix and try again!'" }
      },
      {
        start: "Robo’s eyes light up: 'Initializing process... let’s proceed.'",
        finish: "Robo hums softly: 'Process completed. Ready for the next input.'",
        failure: -> (error) { "Robo emits a soft whir: 'Process halted. Error: \"#{error.message}\". Reassessing commands.'" }
      },
      {
        start: "Epoch hums with energy: 'Destination locked. Moving through time.'",
        finish: "Epoch rests quietly: 'Jump successful. Awaiting the next journey.'",
        failure: -> (error) { "Epoch slows to a stop, engines sputtering: 'Temporal lock failed. Error: \"#{error.message}\". Systems stabilizing.'" }
      },
      {
        start: "Schala’s gentle voice calls out: 'The path opens before you...'",
        finish: "Schala’s soothing tone fades: 'The journey is complete. Well done.'",
        failure: -> (error) { "Schala’s voice fades, tinged with regret: 'The way is blocked... Error: \"#{error.message}\". But do not lose hope.'" }
      },
      {
        start: "The pendulum swings wildly: 'The moment of action is here!'",
        finish: "The pendulum steadies: 'Action resolved. Balance restored.'",
        failure: -> (error) { "The pendulum stops abruptly, its motion halted: 'Time itself falters. Error: \"#{error.message}\". The balance remains broken.'" }
      }
    ].sample
    [
      {
        start: "\e[34mChrono raises his blade high: 'Let’s start this!'\e[0m",
        finish: "\e[32mChrono lowers his blade: 'It’s done. The path is clear.'\e[0m",
        failure: -> (error) { "\e[31mChrono falters mid-swing, his grip trembling: 'The strike didn’t land. The shadows whisper of an error: \"\e[35m#{error.message}\e[31m\".'\e[0m" }
      },
      {
        start: "\e[34mLucca powers up her contraption: 'Initiating the sequence!'\e[0m",
        finish: "\e[32mLucca wipes her goggles: 'Sequence complete! Everything’s working perfectly.'\e[0m",
        failure: -> (error) { "\e[31mLucca slaps her machine, sparks flying: 'The system’s malfunctioned! Error detected: \"\e[35m#{error.message}\e[31m\".'\e[0m" }
      },
      {
        start: "\e[34mMarle steadies her crossbow: 'The moment is here!'\e[0m",
        finish: "\e[32mMarle smiles with relief: 'That’s a bullseye!'\e[0m",
        failure: -> (error) { "\e[31mMarle lowers her crossbow with a sigh: 'I missed... something’s off. Error: \"\e[35m#{error.message}\e[31m\".'\e[0m" }
      },
      {
        start: "\e[34mFrog raises the Masamune: 'Let us strike with honor and valor!'\e[0m",
        finish: "\e[32mFrog sheathes the Masamune: 'The deed is done. Honor and time are preserved.'\e[0m",
        failure: -> (error) { "\e[31mFrog kneels solemnly, the Masamune trembling in his hands: 'T’is ill fortune. The strike hath failed us. Error: \"\e[35m#{error.message}\e[31m\".'\e[0m" }
      },
      {
        start: "\e[34mMagus glances to the sky: 'The gears of fate are in motion now.'\e[0m",
        finish: "\e[32mMagus folds his arms: 'The outcome is clear. Let us proceed.'\e[0m",
        failure: -> (error) { "\e[31mMagus glares into the void, his voice low: 'The threads of destiny slip from my grasp. Error: \"\e[35m#{error.message}\e[31m\". Fate resists me... for now.'\e[0m" }
      },
      {
        start: "\e[34mAyla shouts: 'Me start smash now!'\e[0m",
        finish: "\e[32mAyla cheers: 'Smash done! Me ready for next one!'\e[0m",
        failure: -> (error) { "\e[31mAyla groans, frustrated: 'Smash no work. Error say: \"\e[35m#{error.message}\e[31m\". Ayla fix and try again!'\e[0m" }
      },
      {
        start: "\e[34mRobo activates his systems: 'Executing command protocol...'\e[0m",
        finish: "\e[32mRobo powers down slightly: 'Command executed. Awaiting next input.'\e[0m",
        failure: -> (error) { "\e[31mRobo’s circuits flicker, a faint whir escaping: 'Critical error detected: \"\e[35m#{error.message}\e[31m\". Systems need recalibration.'\e[0m" }
      },
      {
        start: "\e[34mEpoch charges its engines: 'Time to break the barrier!'\e[0m",
        finish: "\e[32mEpoch settles back into the timestream: 'Barrier broken. Ready for the next jump.'\e[0m",
        failure: -> (error) { "\e[31mEpoch halts mid-flight, systems flickering: 'Temporal jump failed. Error: \"\e[35m#{error.message}\e[31m\". Recalibrating coordinates.'\e[0m" }
      },
      {
        start: "\e[34mSchala’s voice echoes softly: 'The journey begins...'\e[0m",
        finish: "\e[32mSchala’s voice fades gently: 'The task is complete. You’ve done well.'\e[0m",
        failure: -> (error) { "\e[31mSchala’s voice trembles, filled with sorrow: 'The path is obstructed... Error: \"\e[35m#{error.message}\e[31m\". We must find another way.'\e[0m" }
      },
      {
        start: "\e[34mThe gates of time shimmer: 'Opening the path to destiny...'\e[0m",
        finish: "\e[32mThe gates of time close softly: 'The timeline is stable once more.'\e[0m",
        failure: -> (error) { "\e[31mThe gates of time flicker violently: 'The path resists us. Error: \"\e[35m#{error.message}\e[31m\". The way remains sealed.'\e[0m" }
      },
      {
        start: "\e[34mChrono leaps forward: 'The enemy will fall before me!'\e[0m",
        finish: "\e[32mChrono stands victorious: 'The battle is won!'\e[0m",
        failure: -> (error) { "\e[31mChrono stumbles back, exhausted: 'I’ve failed... Error: \"\e[35m#{error.message}\e[31m\". I must try again.'\e[0m" }
      },
      {
        start: "\e[34mLucca adjusts the dials: 'Let’s see if this works!'\e[0m",
        finish: "\e[32mLucca lets out a sigh of relief: 'It’s working. We’ve made it through.'\e[0m",
        failure: -> (error) { "\e[31mLucca’s machine whirs and sputters: 'Something went wrong. Error: \"\e[35m#{error.message}\e[31m\". The system is failing.'\e[0m" }
      },
      {
        start: "\e[34mMarle steadies herself: 'I won’t miss this time!'\e[0m",
        finish: "\e[32mMarle celebrates: 'Bullseye! The target is down.'\e[0m",
        failure: -> (error) { "\e[31mMarle curses under her breath: 'Not again! Error: \"\e[35m#{error.message}\e[31m\". I’ll need to re-aim.'\e[0m" }
      },
      {
        start: "\e[34mFrog charges into battle: 'For the kingdom! For the honor!'\e[0m",
        finish: "\e[32mFrog sheathes his sword: 'The mission is complete. Honor has been upheld.'\e[0m",
        failure: -> (error) { "\e[31mFrog grips the Masamune tightly, his face somber: 'The mission was a failure. Error: \"\e[35m#{error.message}\e[31m\". We must regroup.'\e[0m" }
      },
      {
        start: "\e[34mMagus conjures dark energy: 'Let the power of the darkness be unleashed!'\e[0m",
        finish: "\e[32mMagus surveys the aftermath: 'The chaos has been contained... for now.'\e[0m",
        failure: -> (error) { "\e[31mMagus clenches his fist in frustration: 'The power slipped through my grasp. Error: \"\e[35m#{error.message}\e[31m\". I must find another way.'\e[0m" }
      },
      {
        start: "\e[34mAyla cracks her knuckles: 'Smash time!' \e[0m",
        finish: "\e[32mAyla cheers: 'Smash complete! Me win again!'\e[0m",
        failure: -> (error) { "\e[31mAyla looks disappointed: 'Smash no work. Error: \"\e[35m#{error.message}\e[31m\". Me need to try harder!'\e[0m" }
      },
      {
        start: "\e[34mRobo activates his boosters: 'Systems online. Ready for action.'\e[0m",
        finish: "\e[32mRobo reports: 'Mission complete. All systems stable.'\e[0m",
        failure: -> (error) { "\e[31mRobo’s mechanical arm freezes in place: 'Error detected: \"\e[35m#{error.message}\e[31m\". Recalibrating.'\e[0m" }
      },
      {
        start: "\e[34mEpoch charges its temporal engines: 'Navigating through time!'\e[0m",
        finish: "\e[32mEpoch lands with a soft thud: 'Timeline verified. Jump successful.'\e[0m",
        failure: -> (error) { "\e[31mEpoch jolts, systems crashing: 'Temporal disruption detected. Error: \"\e[35m#{error.message}\e[31m\". Initiating repair.'\e[0m" }
      },
      {
        start: "\e[34mSchala prepares the spell: 'The moment is upon us.'\e[0m",
        finish: "\e[32mSchala breathes out softly: 'The spell is cast. We are safe for now.'\e[0m",
        failure: -> (error) { "\e[31mSchala’s energy flares out of control: 'The spell is incomplete. Error: \"\e[35m#{error.message}\e[31m\". We must start anew.'\e[0m" }
      },
      {
        start: "\e[34mThe gates of time hum: 'Temporal doorways are opening.'\e[0m",
        finish: "\e[32mThe gates close gently: 'The timeline is restored.'\e[0m",
        failure: -> (error) { "\e[31mThe gates flicker and close rapidly: 'Error in time manipulation: \"\e[35m#{error.message}\e[31m\". Recalibration needed.'\e[0m" }
      },
      {
        start: "\e[34mChrono draws his sword: 'I’ll fight for the future!'\e[0m",
        finish: "\e[32mChrono wipes his brow: 'The fight is over. The world is safe.'\e[0m",
        failure: -> (error) { "\e[31mChrono stumbles, sword dropping from his hand: 'The battle has been lost. Error: \"\e[35m#{error.message}\e[31m\". I must try again.'\e[0m" }
      },
      {
        start: "\e[34mLucca adjusts her goggles: 'Let’s make history!'\e[0m",
        finish: "\e[32mLucca exclaims: 'It worked! The past has been changed!'\e[0m",
        failure: -> (error) { "\e[31mLucca slams her fist on the console: 'This wasn’t supposed to happen. Error: \"\e[35m#{error.message}\e[31m\". I need to reprogram.'\e[0m" }
      },
      {
        start: "\e[34mMarle raises her bow: 'I’ll hit my target this time!'\e[0m",
        finish: "\e[32mMarle cheers: 'Perfect shot! The mission is complete.'\e[0m",
        failure: -> (error) { "\e[31mMarle frowns, frustrated: 'I missed! Error: \"\e[35m#{error.message}\e[31m\". I’ll try again.'\e[0m" }
      },
      {
        start: "\e[34mFrog charges forward: 'For the kingdom!'\e[0m",
        finish: "\e[32mFrog nods in approval: 'The battle has ended. We are victorious.'\e[0m",
        failure: -> (error) { "\e[31mFrog’s Masamune falters: 'The kingdom is in danger... Error: \"\e[35m#{error.message}\e[31m\". We must try again.'\e[0m" }
      }
    ].sample
  end

  def self.next_trigger_quote(time)
    time_string = time.strftime("%H:%M")
    quotes =
      [
        "\e[33mThe clock ticks on... next trigger at #{time_string}.\e[0m",
        "\e[33mThe timeline bends toward the next event at #{time_string}.\e[0m",
        "\e[33mMarle smiles: 'We’re on course. Next action: #{time_string}.'\e[0m",
        "\e[33mEpoch recalibrating—next stop: #{time_string}.\e[0m",
        "\e[33mAyla grins: 'Me wait for #{time_string}. Then go smash event!'\e[0m",
        "\e[33mThe gate glimmers faintly... next trigger at #{time_string}.\e[0m",
        "\e[33mRobo scans the horizon: 'Next checkpoint: #{time_string}.'\e[0m",
        "\e[33mMagus gazes into the distance: 'The moment comes... #{time_string} awaits.'\e[0m",
        "\e[33mLucca checks her watch: 'Right on schedule for #{time_string}!'\e[0m",
        "\e[33mThe winds of time carry whispers of the next event at #{time_string}.\e[0m",
        "\e[33mFrog adjusts his armor: 'We shall be ready at #{time_string}.'\e[0m",
        "\e[33mEpoch steadies itself in preparation for #{time_string}.\e[0m",
        "\e[33mChrono silently waits for the perfect moment: #{time_string}.\e[0m",
        "\e[33mThe pendulum swings... next destination: #{time_string}.\e[0m",
        "\e[33mSchala’s voice hums faintly: 'The moment draws near... #{time_string}.'\e[0m",
        "\e[33mRobo calculates: 'Timeline stable. Next event set for #{time_string}.'\e[0m",
        "\e[33mMarle adjusts her bow: 'Almost time... #{time_string} is the moment.'\e[0m",
        "\e[33mLucca tightens a bolt: 'Keep an eye out! #{time_string} is the target.'\e[0m",
        "\e[33mMagus mutters: 'Soon... the plan aligns at #{time_string}.'\e[0m",
        "\e[33mThe clock glows faintly, marking #{time_string} as the next divergence.\e[0m"
      ]
    quotes.sample
  end

  def self.sleep_quote
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
    ].sample
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
    raise ArgumentError "trigger_frequency can't be less than sleep_time" if trigger_frequency < sleep_time

    raise ArgumentError "minimum sleep_time is 1 second" if sleep_time < 1

    @trigger_frequency = trigger_frequency
    @sleep_time = sleep_time
  end

  def timestamp
    "#{Time.now.strftime("%H:%M:%S")}"
  end

  def start(&block)
    trigger_time = Time.now
    next_trigger_check = Time.now

    while true
      if Time.now >= trigger_time
        begin
          execution_quote = Quotes.execution_quotes
          puts "#{timestamp}: #{execution_quote[:start]}"
          block.call
          puts "#{timestamp}: #{execution_quote[:finish]}"
        rescue Exception => error
          puts "#{timestamp}: #{execution_quote[:failure].(error)}"
        ensure
          trigger_time = Time.now + trigger_frequency
          next_trigger_check = Time.now + sleep_time
          puts "#{timestamp}: #{Quotes.next_trigger_quote(trigger_time)}"
        end
      elsif Time.now >= next_trigger_check
        puts "#{timestamp}: #{Quotes.sleep_quote}"
        next_trigger_check = Time.now + sleep_time
      end
      sleep(1)
    end
  end
end
