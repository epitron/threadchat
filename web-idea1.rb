require 'sinatra'
# require "sinatra/reloader"

log = %{2013-08-27 13:38:01 SmoothPorcupine Yeah.
2013-08-27 13:38:11 Blazinghand i am
2013-08-27 13:38:25 SoundLogic  Now without changing anything else, I want you to picture one of them falling out of the sky.
2013-08-27 13:38:30 feep  I KNEW IT
2013-08-27 13:38:33 feep  I KNEW YOU WOULD SAY THAT
2013-08-27 13:38:42 SoundLogic  feep: Shush.
2013-08-27 13:38:54 feep  and yeah, it feels broken
2013-08-27 13:38:55 Blazinghand okay
2013-08-27 13:39:03 Khoth okay, now what?
2013-08-27 13:39:03 SoundLogic  SmoothPorcupine, you doing it?
2013-08-27 13:39:13 SmoothPorcupine Processing.
2013-08-27 13:39:27 Blazinghand can we change the engines
2013-08-27 13:39:28 feep  SoundLogic: I don't think I can do that
2013-08-27 13:39:29 Blazinghand for this
2013-08-27 13:39:36 SoundLogic  Blazinghand: No.
2013-08-27 13:39:37 feep  I mean I can if I render it purely visual, but not in a physical model
2013-08-27 13:39:39 SoundLogic  Just picture it falling
2013-08-27 13:39:41 SmoothPorcupine I can do it.
2013-08-27 13:39:43 SoundLogic  feep: No spoilers
2013-08-27 13:40:00 feep  SoundLogic: I _guessed_, I don't _know_. I'm a clean participant.
2013-08-27 13:40:02 Blazinghand I can do it as well, though it doesn't seem like what i'm imagining is physicall possible
2013-08-27 13:40:33 SoundLogic  One of the two things you imagined is nonsensical. And if you truely UNDERSTOOD airplains, it would be as impossible as imaging the hand seperate from the components that make it up
2013-08-27 13:40:37 SmoothPorcupine Depends on what you mean by "physically."
2013-08-27 13:40:42 SoundLogic  As feep correctly guessed
2013-08-27 13:40:58 feep  SoundLogic: the thing is, the component "hand" has more aspects than [fingers, body, thumb]
2013-08-27 13:41:07 Blazinghand a plane won't fall out of the sky assuming that we don't change the engines, air, gravity
2013-08-27 13:41:10 SoundLogic  feep: What else?
2013-08-27 13:41:13 feep  there's a ... _thing_ that
2013-08-27 13:41:16 feep  I can't put it into words
2013-08-27 13:41:20 Blazinghand it's not really possible for that to happen
2013-08-27 13:41:23 feep  I agree that it's nonsensical
2013-08-27 13:41:24 SoundLogic  Blazinghand: Either the air, gravity, and engines keep it in the air, or they don't.
2013-08-27 13:41:32 feep  but I think it's _differently_ nonsensical than the brain
2013-08-27 13:41:34 feep  ...
2013-08-27 13:41:35 feep  plane*
2013-08-27 13:41:46 Blazinghand however my model of a plane is bad. when I imagine a plane, I don't imagine a real plane, I imagine an image of a plane
2013-08-27 13:41:46 SoundLogic  ONE of the things you imagined must be impossible. I don't know which
2013-08-27 13:41:52 SoundLogic  Blazinghand: EXACTLY!
2013-08-27 13:41:59 SmoothPorcupine SoundLogic, planes exist on two levels.
2013-08-27 13:42:03 feep  it's like, the plane's _flight_ is inevitably linked with the air
2013-08-27 13:42:16 SmoothPorcupine There's the plane itself, and the physical model of the plane.
2013-08-27 13:42:20 feep  so I break the model if I ...... oh
2013-08-27 13:42:22 feep  the flight is a process
2013-08-27 13:42:28 feep  the hand position is a state
2013-08-27 13:42:30 SmoothPorcupine An intelligent being can identify the two as separate.
2013-08-27 13:42:34 feep  I think that's why I can do it with the hand
2013-08-27 13:42:44 SmoothPorcupine An AI is less intelligent than me if it can't fathom an image of a plane.
2013-08-27 13:42:46 feep  a state can be updated without needing to be refreshed
2013-08-27 13:42:47 SoundLogic  feep: I think what happens is you stop picturing and start listing.
2013-08-27 13:42:54 feep  SoundLogic: no it was very pictury
2013-08-27 13:42:59 feep  very felt-y
2013-08-27 13:43:11 SmoothPorcupine And similarly, if it can't imagine two identical planes going different routes.
2013-08-27 13:43:12 feep  SoundLogic: the thing is, I _think_ with the plane I'm more aware of the updateful nature of its flight
2013-08-27 13:43:31 feep  I can _hold_ the hand at a delta position, but I can't hold the plane because flight is ... updateful?
2013-08-27 13:43:31 SoundLogic  SmoothPorcupine: This is a trap that a lot of people fall in (myself included more often than I would like)}

unless defined? LogLine
  class LogLine < Struct.new(:date, :time, :nick, :msg, :thread)
    def initialize(line)
      super *line.chomp.split(/\s+/, 4), rand(3)
    end
  end
end

log = log.lines.map { |l| LogLine.new(l) }
colors = %w[#8f8 #f0f #ff0 #88f #f88]

get "/" do
  nickcolors = Hash[log.group_by(&:nick).keys.zip(colors)]
  haml :index_idea1, locals: {log: log, nickcolors: nickcolors}
end
