-- Quest texts left in (mis-encoded) Russian in the default tables: the English text is restored from TDB 7.3.5,
-- else TDB 12.1, else the English text that sat in the frFR locale row; the few quests found nowhere else
-- (custom or removed ones) were translated from the Russian. Also: 5 reward texts left in German and 33 texts
-- with mis-encoded accents and apostrophes.

UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back to the land of the living, $n. We nearly lost you in that explosion! Lucky for us that the Wandering Isle happened to be traveling nearby.$B$BThe people here have graciously allowed us to reside at the temple. It''s not like the Peak of Serenity, but this will make a fine new home.
' WHERE `ID` = 12103;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. This is just what we needed. It''s going to be a chore keeping all the tables stocked with fresh food, but it''s well worth it.' WHERE `ID` = 14023;
UPDATE `quest_offer_reward` SET `RewardText` = 'The pumpkin pie''s been a big hit up here. I''ve never seen a dwarf get so excited about anything made from a vegetable.' WHERE `ID` = 14024;
UPDATE `quest_offer_reward` SET `RewardText` = 'Finally, the cranberry chutney I was promised. You wouldn''t believe how fast the celebrants go through the stuff here.' WHERE `ID` = 14028;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thanks for bringing everything. I was starting to get worried.$B$BWhile you''re here, you should try your hand at making some candied sweet potatoes.' WHERE `ID` = 14030;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are just what I need. Thanks, $n. You''re a lifesaver.' WHERE `ID` = 14048;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thanks. This looks great, and you''re a fair bit faster than Jasper, but don''t tell him I said so.' WHERE `ID` = 14053;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are perfect. Isaac, and everyone else, will love them!' WHERE `ID` = 14054;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are perfect. Thanks for helping me with this, $n. The meal will get served on time and Ellen will be happy.' WHERE `ID` = 14055;
UPDATE `quest_offer_reward` SET `RewardText` = 'Deep claw marks run through the man''s corpse.' WHERE `ID` = 14078;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent!  I''ll make sure these get taken to a safe place.' WHERE `ID` = 14094;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good job, $N.  Thanks to you, many Gilneans will live to see another day.' WHERE `ID` = 14098;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''re all fine here.  A little shaken... but alive.' WHERE `ID` = 14099;
UPDATE `quest_offer_reward` SET `RewardText` = 'We did it, $N.  Thanks to you a good man has survived.' WHERE `ID` = 14154;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greymane wants to save Crowley?  Has he gone mad?' WHERE `ID` = 14157;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t look at me!  Leave me alone!' WHERE `ID` = 14159;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent.  I''ll start rounding up some help to get these cannons positioned.' WHERE `ID` = 14204;
UPDATE `quest_offer_reward` SET `RewardText` = 'I knew Crowley would come through.  His weapons will be more than useful to us.' WHERE `ID` = 14214;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well, $N.  You''ve done more than could be asked of any Gilnean.$B$BWe''re running low on ammunition.  It''s time to regroup inside now.' WHERE `ID` = 14218;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve given them everything we have... yet still they come.  Do not worry, $N.  We''ll slay many more before today is over.' WHERE `ID` = 14221;
UPDATE `quest_offer_reward` SET `RewardText` = 'They... they''ve stopped coming.$B$BNo, $N.  That''s not a good thing.' WHERE `ID` = 14222;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, hey!  There you are!' WHERE `ID` = 14269;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t get ahead of yourself now. Just remember who taught you everything you know.$B$BAnd now let''s see if we can get out of this city with our skins attached.
' WHERE `ID` = 14272;
UPDATE `quest_offer_reward` SET `RewardText` = 'A darkness has descended over our lands. And not our kind of darkness, if you know what I mean.
' WHERE `ID` = 14273;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well in coming here.  If we Gilneans stick together we might yet defeat this terrible enemy.' WHERE `ID` = 14285;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well in coming here. If we Gilneans stick together we might yet defeat this terrible enemy.
' WHERE `ID` = 14287;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well in coming here. If we Gilneans stick together we might yet defeat this terrible enemy.
' WHERE `ID` = 14290;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $N.  We''ll make sure Krennan makes it out of the city alive.' WHERE `ID` = 14293;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''re left with very few choices, $N.  What we do next will be a critical decision.' WHERE `ID` = 14294;
UPDATE `quest_offer_reward` SET `RewardText` = 'It worked!  By the Light, it worked!' WHERE `ID` = 14313;
UPDATE `quest_offer_reward` SET `RewardText` = 'The crate has been smashed and the vials inside of it appear to have been broken.' WHERE `ID` = 14320;
UPDATE `quest_offer_reward` SET `RewardText` = 'Forsaken!  Quick, $N!  We must mount a defense.' WHERE `ID` = 14321;
UPDATE `quest_offer_reward` SET `RewardText` = 'You and me, $N.  We make a great team...$B$BIt''s good to have you back.' WHERE `ID` = 14348;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great news, $N.  I''ve sent the remaining militia to the shore to meet the Forsaken force head on.' WHERE `ID` = 14366;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Forsaken are here in full strength, $N.  We barely have enough men to hold them back.' WHERE `ID` = 14367;
UPDATE `quest_offer_reward` SET `RewardText` = 'Not bad, $N.  It''s a good thing you''re on our side.' WHERE `ID` = 14369;
UPDATE `quest_offer_reward` SET `RewardText` = 'I need you to pull through, $N.  This dosage is strong enough to kill a horse.$B$BBut I know you.  I know what you''re made of.  You will be fine.$B$BTrust me.  I know what you''re going through.$B$BNow drink up and close your eyes.' WHERE `ID` = 14375;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $N.  You might be a bloody beast, but you''re our beast.' WHERE `ID` = 14382;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did it, $N.  That should take the wind out of their sails.' WHERE `ID` = 14386;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did what you could, $N.  With any luck a few others will find their way to shore.' WHERE `ID` = 14395;
UPDATE `quest_offer_reward` SET `RewardText` = 'The ocean, $N.  It swallowed everything... the land... the Forsaken... our men!' WHERE `ID` = 14396;
UPDATE `quest_offer_reward` SET `RewardText` = 'Liam is right.  We must get everyone to higher ground.$B$BYou must help me spread the word while I manage the logistics of the evacuation.' WHERE `ID` = 14397;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re a peach, $N.  Thanks!' WHERE `ID` = 14400;
UPDATE `quest_offer_reward` SET `RewardText` = 'You here to give us a hand?' WHERE `ID` = 14403;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is great, $N.  I should be able to finish the repairs in no time.' WHERE `ID` = 14404;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s just as well, $N.  Maybe the Haywards will fare better than us.' WHERE `ID` = 14405;
UPDATE `quest_offer_reward` SET `RewardText` = 'Stay back! Don''t make me...$B$BIs it you?  By the Light!  It''s you, $N!' WHERE `ID` = 14406;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent!  I''m almost done here.' WHERE `ID` = 14412;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve got the horses, I''ll make sure Duskhaven gets them.' WHERE `ID` = 14416;
UPDATE `quest_offer_reward` SET `RewardText` = 'Are you ready to set sail, $N?  Your people have been granted shelter in the lands of the kaldorei.$B$BDo not worry, $r.  Your people will get a chance to fight for Gilneas again.  This time, with the full strength of the Alliance.' WHERE `ID` = 14434;
UPDATE `quest_offer_reward` SET `RewardText` = 'Look, $N!  Look at what''s become of Duskhaven!$B$BLook at what''s become of the last safe place in Gilneas!' WHERE `ID` = 14467;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thanks for stopping, $N.  Our carriage got hit pretty bad.$B$BThe one in front of us got it worse.' WHERE `ID` = 24438;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done it again, $N.  You have my thanks.' WHERE `ID` = 24468;
UPDATE `quest_offer_reward` SET `RewardText` = 'You definitely got the ettin angry, $N.   I heard him myself.$B$BLet''s hope this works.' WHERE `ID` = 24472;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s good to see you made it, $N.  It looks like most everybody did.$B$BWe''re not doing too bad so far for an emergency evacuation.' WHERE `ID` = 24483;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well, $N.  The spiders are everywhere, however, and I''m afraid we''ve barely put a dent in their numbers.' WHERE `ID` = 24484;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $N.  It will take some time, but I''ll try to make sense of what we have.' WHERE `ID` = 24495;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great job, $N.  We''ve heard rumors of survivors further in the mountains.  Now we''ll be able to send scouts there.' WHERE `ID` = 24501;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done it again, $N.  The freed villagers are eager to help us against the Forsaken in any way they can.' WHERE `ID` = 24575;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve been expecting you, $N.  Do not be alarmed.$B$BMy name is Belysra.  I am a priestess of the moon... a night elf.$B$BYou might not know my people, but the destinies of our two races have been linked since the Curse befell you.' WHERE `ID` = 24578;
UPDATE `quest_offer_reward` SET `RewardText` = 'I wish it could''ve been avoided, $N.  Let us ensure this is resolved without further bloodshed.' WHERE `ID` = 24592;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is done then, $N.  You are one of us now.' WHERE `ID` = 24593;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $N.  Let us hope this works.' WHERE `ID` = 24602;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $N.  The scout never had a chance.' WHERE `ID` = 24616;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re all right, $N!  I''ve been waiting for this day for a long time, it truly is great to see you friend.$B$BI''ve heard of what you''ve done and I''m thankful... especially for Lorna -- she''s all I''ve left.  I will send for her right away.' WHERE `ID` = 24617;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are as good as I remember, $N.  It is good to have you back.' WHERE `ID` = 24627;
UPDATE `quest_offer_reward` SET `RewardText` = 'These simple leaves grow by Elune''s grace.  They will help your mind understand the need for balance and your soul will permanently earn mastery over the beast.' WHERE `ID` = 24628;
UPDATE `quest_offer_reward` SET `RewardText` = 'I knew we could count on you.  You''ve done well, $N.' WHERE `ID` = 24646;
UPDATE `quest_offer_reward` SET `RewardText` = 'King Greymane gave me a brief rundown of the plan before he set off for the Blackwald.  Doesn''t make it sound any less crazy.' WHERE `ID` = 24673;
UPDATE `quest_offer_reward` SET `RewardText` = 'I thank you, $N.  Our men and women will have a last good meal before they set off for battle.' WHERE `ID` = 24675;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am glad to have you here, $N.  We''re surrounded by Forsaken on all sides and can use all the help we can get.' WHERE `ID` = 24677;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s good to see you again, $N.' WHERE `ID` = 24680;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s almost over, $N.  Only one obstacle remains between us and survival.' WHERE `ID` = 24681;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Plague?  Something so heinous that not even the orcs condone its use?  I''d say this warrants notifying King Greymane.' WHERE `ID` = 24902;
UPDATE `quest_offer_reward` SET `RewardText` = 'You present me with the most difficult choice of my life, $N.' WHERE `ID` = 24903;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve driven the Forsaken back.  We hold three out of the four districts.$B$BBut at what cost...' WHERE `ID` = 24904;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well, $N.  Almost everybody managed to make it through.  ' WHERE `ID` = 24920;
UPDATE `quest_offer_reward` SET `RewardText` = 'I suppose your abilities are... suitable.  Color me impressed.' WHERE `ID` = 25223;
UPDATE `quest_offer_reward` SET `RewardText` = 'So you managed to pass this part of the test without getting yourself eaten by Smolderos or being incinerated by the fire elementals?$B$BI suppose I should congratulate you on ascending the lowest rung of our ladder.$B$BWell... congratulations, recruit!' WHERE `ID` = 25224;
UPDATE `quest_offer_reward` SET `RewardText` = 'Lok''tar, $c! Don''t worry about this cage - these animals will come to fear me before long.$B$BMy first priority is to clear this filth away from my beloved shrine.' WHERE `ID` = 25269;
UPDATE `quest_offer_reward` SET `RewardText` = 'You were brave to face down Lycanthoth, $n. Like myself, he was a primal force of nature... but his origins were from a darker place.$B$BThose who birthed that beast reached deep into the blackness, channeling powers never intended for this world.$B$BCome, $c. Climb onto my back, and let us show these beasts the true face of ferocity!' WHERE `ID` = 25272;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent.  I''ll do my best to alter these documents.' WHERE `ID` = 25274;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hah! So you really sent some heads rolling, did you?$B$BIt was said during the War of the Ancients that Lo''Gosh fought demons for ten days solid. Hopefully you weren''t fighting that long...' WHERE `ID` = 25277;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent.  This little pup will grow to be strong and merciless like his father.' WHERE `ID` = 25294;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent job, $n.  Or should I say: "$n"damus?$B$BGive me a minute to read these.' WHERE `ID` = 25296;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve succeeded, $ndamus.  You''re ready for the next step.' WHERE `ID` = 25299;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re on the fast-track to success.  Let us hope you don''t ruin your track record with such silly notions as compassion and humaneness.$B$BCome, then.  Let us discuss your future.' WHERE `ID` = 25309;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $ndamus.  We must show all would-be competitors that we are not ones to give up easily.' WHERE `ID` = 25310;
UPDATE `quest_offer_reward` SET `RewardText` = 'Sharp as always.  You do not disappoint me.' WHERE `ID` = 25311;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n.  Our plan''s almost come together.' WHERE `ID` = 25314;
UPDATE `quest_offer_reward` SET `RewardText` = 'You.  You''re clearly not with them.$B$BAn ally then?' WHERE `ID` = 25315;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $ndamus.  I''m having the servants you chose for me briefed on their new duties.' WHERE `ID` = 25330;
UPDATE `quest_offer_reward` SET `RewardText` = 'So, it is true! You indeed carry lightning in your hands.$B$BYou are the chosen one, $n. You will be my champion, and carry my vengeance to realms where I cannot tread...' WHERE `ID` = 25355;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent!  Our pup is ready for a fight.' WHERE `ID` = 25494;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh.  You''re still alive.$B$BNot bad.' WHERE `ID` = 25499;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very well.  You''re at least competent enough to figure out which way the pointy end of the pick goes.' WHERE `ID` = 25509;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done! How does it feel?$B$BIt is challenging to master flight in this burning wasteland, but it is the only way.$B$BI hope you''re ready for battle, $n...' WHERE `ID` = 25523;
UPDATE `quest_offer_reward` SET `RewardText` = 'By the wings of Aviana - you were born to fly, $n!$B$BQuickly, let''s get back out there and hit them again...' WHERE `ID` = 25544;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did well, $n.  I''ve a new target for you.' WHERE `ID` = 25548;
UPDATE `quest_offer_reward` SET `RewardText` = 'You continue to prove your prowess, $n.  At this rate Hyjal might survive this ordeal after all.' WHERE `ID` = 25549;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hyjal has been saved, $n.  And it''s all thanks to you.' WHERE `ID` = 25551;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well, $n.  We will use this to draw out the Twilight matriarch.' WHERE `ID` = 25552;
UPDATE `quest_offer_reward` SET `RewardText` = 'These foul books should not be allowed to exist.  Yet the information inside them is of vital importance.' WHERE `ID` = 25554;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hey there.  I''m glad to see they sent someone of your caliber for this operation.$B$BThis here''s going to call for some subtlety.  We can''t risk Commander Shadowsong getting killed.' WHERE `ID` = 25597;
UPDATE `quest_offer_reward` SET `RewardText` = 'They''re moving supplies to Hyjal straight from the elemental planes? Devious.$B$BYou''ve made Lo''Gosh proud by sealing that flamegate, $n, but there may be more portals to seal. You should check with the other shrines!' WHERE `ID` = 25612;
UPDATE `quest_offer_reward` SET `RewardText` = 'You were right to come to me with this, $n.  This represents a great threat to us if we do not act swiftly and boldly.' WHERE `ID` = 25644;
UPDATE `quest_offer_reward` SET `RewardText` = 'By relieving Tortolla of his final burdens you have acquired for us a formidable ally... and the final piece of the puzzle.$B$BSteel yourself, $n. The most difficult part of our journey is to begin.$B$BWe will bring the fight to their stronghold.' WHERE `ID` = 25653;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, that''s a start.$B$BThe birds who laid these eggs will never accept them again, so we''ll have to raise these birds as orphans in the shrine here. Were Aviana here, she never would''ve let this travesty happen.$B$BBut, on to business...' WHERE `ID` = 25656;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was nasty work, $n, but it had to be done.$B$BAnd if Aviana is truly to be resurrected, then perhaps your actions have enabled Blaithe to someday come back as well?$B$BNow let''s see if we can contact our long lost guardian...' WHERE `ID` = 25664;
UPDATE `quest_offer_reward` SET `RewardText` = 'Slow down, $c! You look as though you''ve seen a ghost...' WHERE `ID` = 25665;
UPDATE `quest_offer_reward` SET `RewardText` = 'So the harpies are tools of some sort of dragon - "Sethria."$B$BBut what are the dragons doing to those eggs? And what''s this ''special'' egg that Sethria wanted so badly?$B$BThis is beyond me, $n. I''ve given a report to Skylord Omnuron - he''ll know what to do next.' WHERE `ID` = 25731;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, $n! I was hoping to see you out here.$B$BWhat, Omnuron calls this a ''fact-finding mission?'' Bah! Facts are best found on corpses.$B$BLet''s do some damage.' WHERE `ID` = 25740;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re good at this.$B$BI like you.' WHERE `ID` = 25746;
UPDATE `quest_offer_reward` SET `RewardText` = 'Look at these things. Ugh, the runes make my eyes hurt. This one here is meant to sear flesh? Seriously? Ouch! Wait a minute...$B$BThese plates are designed to be riveted directly into flesh. The pain must be unbearable!' WHERE `ID` = 25758;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was some fancy bladework, $n!$B$BThere''s one less threat for us to worry about in Hyjal.' WHERE `ID` = 25761;
UPDATE `quest_offer_reward` SET `RewardText` = 'They''re doing what?$B$BThey''re cloaking something? Of course - so our aerial scouts can''t see anything with our eagle-eyes!' WHERE `ID` = 25763;
UPDATE `quest_offer_reward` SET `RewardText` = 'Sethria is slain! I knew it was worth the risk.$B$BI''ll stay here to look for survivors, but I imagine they''ll want to see you back at the shrine.' WHERE `ID` = 25776;
UPDATE `quest_offer_reward` SET `RewardText` = 'I ... live.$B$BThose that tried to corrupt me and kidnap my children will soon feel the rake of my talons, $c. Believe it.$B$BContinue to push forward across Hyjal. I will collect myself and assemble with the other ancients.' WHERE `ID` = 25807;
UPDATE `quest_offer_reward` SET `RewardText` = 'So it''s true - Aviana has returned, with you as her herald.$B$BThere''s much to be done here. We are deep in the heart of the Firelands. Sethria smuggled stolen eggs from Mount Hyjal here to hatch her own hideous creations - birds of prey, trained for war.$B$BI hope you''re ready to fight back!' WHERE `ID` = 25810;
UPDATE `quest_offer_reward` SET `RewardText` = 'I ... have not yet ... perished.' WHERE `ID` = 25830;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $r.$B$BI am ready now.$B$BAll that I am, and all that this forest once was... it is now yours.' WHERE `ID` = 25842;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve assembled the survivors? Good, good. And the rest of the mountain - healed?$B$BHaha, strike me down! We''re on the front lines again!' WHERE `ID` = 25881;
UPDATE `quest_offer_reward` SET `RewardText` = 'Terrific! Twilight''s Hammer will no doubt try to re-take the mountain, but they''ll have to do so without the leadership of those fat-for-brains thugs.' WHERE `ID` = 25886;
UPDATE `quest_offer_reward` SET `RewardText` = 'You killed how many? Well, well. Quite a show. I guess my men don''t have any more excuses.' WHERE `ID` = 25899;
UPDATE `quest_offer_reward` SET `RewardText` = 'This power is ancient.$BPrimitive.$BEasy.$B$BWe will use it against them.' WHERE `ID` = 25904;
UPDATE `quest_offer_reward` SET `RewardText` = 'You were sent by the turtle god? Bless his almighty shell! I thought I was trapped down here forever.' WHERE `ID` = 25906;
UPDATE `quest_offer_reward` SET `RewardText` = 'So it is done.$B$BKnowing that Twilight''s Hammer is in league with creatures of malice such as these... it really curdles the blood.' WHERE `ID` = 25910;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah yes, yes... the secret strength of Nemesis, unearthed here in these caverns.$B$BWe know all that we need to know, $n. It is time to finish this.' WHERE `ID` = 25915;
UPDATE `quest_offer_reward` SET `RewardText` = 'The usurper has perished!$B$BTwilight''s Hammer dreamed of creating their own pantheon of twisted ancients to rule over the land, sea, and air. With your help, they''ve all been executed.$B$BWe must tell Tortolla at once!' WHERE `ID` = 25923;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve been to the firelands?$B$BNemesis is dead?$B$BSo it is finished.$B$BThank you.' WHERE `ID` = 25928;
UPDATE `quest_offer_reward` SET `RewardText` = 'While you remain in Stonetalon and fight as a Krom''gar soldier you will remain suited up! Am I clear? DO you hear me, grunt? If I see you without Hellscream''s beloved tabard I will put my foot so far up your backside that you''ll be spitting up laces.
' WHERE `ID` = 25945;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re certain nobody saw you?  Good.$b$b<Netherwane listens to your recount of the information you saw.>$b$bHmph... fairly harmless stuff.  Either the Horde are foolish enough to NOT be planning something against us... or they''re hiding their information better than I expected.  Either way, well done, soldier.' WHERE `ID` = 26174;
UPDATE `quest_offer_reward` SET `RewardText` = 'While I''m surprised that Connisport is willing to go forward with his plan, I''m also relieved.  I''ve seen the demons rallying around Maldraz, and I share his fears.' WHERE `ID` = 26185;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.  I, and the people of Surwich, are in your debt.$b$bFeel free to take one of these.  While we haven''t got much, we''re happy to reward those that protect us.' WHERE `ID` = 26187;
UPDATE `quest_offer_reward` SET `RewardText` = 'Just smellin'' you comin'' got my stomach rumblin''! We''re gonna eat like kings tonight!' WHERE `ID` = 26230;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve certainly saved me a heap of trouble, $n!  I can''t thank you enough.  It shouldn''t be long now until we see Master Nesingwary''s book in libraries throughout the world!$B$BI''ll leave a copy of the book right here, if you ever want to take a peek at the finished product.  Thanks again, $n!' WHERE `ID` = 26269;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will deploy a battalion of soldiers to Westfall at once! With the Defias Brotherhood reborn, an old threat to the kingdom is renewed.' WHERE `ID` = 26322;
UPDATE `quest_offer_reward` SET `RewardText` = 'My boots... they''re like sausages, $n. Look great, taste great. I tell you they''re filled with nothing but the finest ingredients and meats, and you eat it, and you love it.$b$bIt''s safer--and more enjoyable--if you just trust me, and don''t ask too carefully what''s really inside.' WHERE `ID` = 26344;
UPDATE `quest_offer_reward` SET `RewardText` = 'Five years of work burned to the ground in five minutes. Damn the Defias!$B$BAnd this is only the beginning, $n! We have a long, hard road ahead of us.' WHERE `ID` = 26370;
UPDATE `quest_offer_reward` SET `RewardText` = 'Murder, rookie. That''s what you''re looking at on the ground in front of us.' WHERE `ID` = 26378;
UPDATE `quest_offer_reward` SET `RewardText` = 'I knew it! Looks like Yowler is behind this uprising - which is incredible, because we keep killing gnolls named Yowler. I don''t know how many sons the original Yowler had, but it''s got to be close to a hundred.$B$BWell, looks like we got ourselves another Yowler to kill.$B$BMagistrate Solomon must be notified.' WHERE `ID` = 26503;
UPDATE `quest_offer_reward` SET `RewardText` = 'PERFECT! I''ll put these in the pot right away. Dinner should be ready in a few hours.$B$BThank you, darling!' WHERE `ID` = 26506;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for finding my necklace $G mister : miss; $c... you are very kind!  My kitty thanks you too - isn''t that right Effsee?' WHERE `ID` = 26508;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent! Let me make a few adjustments here and we should be good to go.' WHERE `ID` = 26510;
UPDATE `quest_offer_reward` SET `RewardText` = 'That ought to teach those murlocs a lesson. Hopefully the next time they decide to raid our town they''ll think twice.$B$BWe both know that won''t happen.' WHERE `ID` = 26511;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fantastic work, $n! These will come in handy for our next project, the Lakeshire SUPER BRIDGE, meant to traverse the length of Lake Everstill. It should be done in 20 or so years. Give or take a decade or two.' WHERE `ID` = 26569;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve probably bought us another day, maybe two. Nice work, $n.' WHERE `ID` = 26570;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope with these items and with his crew all rescued he''ll have a change of heart. We can''t do this without Keeshan.  ' WHERE `ID` = 26573;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s orc killin'' time.' WHERE `ID` = 26616;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t go thinking that was too easy. Far greater dangers lurk deeper in the woods.' WHERE `ID` = 26618;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mmm-mmm! The skirtsteak''s the best part. It''s not an efficient way to cook, though.$B$BHere, have this recipe. It''s a little different, but flank meat''s easier to come by when you really need a meal.' WHERE `ID` = 26620;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah yes, a nice lump you have there!  Let me just get this seasoned with my secret spices (no looking!) and get them to skittering on a skillet for a while...$B$BAnd, although Dusky Crab Cakes are my specialty and I won''t give out the recipe, here''s the recipe for a dish that''s almost as good.' WHERE `ID` = 26623;
UPDATE `quest_offer_reward` SET `RewardText` = 'Splendid, $n.  For your service to the people of Darkshire you shall be rewarded.' WHERE `ID` = 26645;
UPDATE `quest_offer_reward` SET `RewardText` = 'What is this?  A comb?  It''s lovely!  And it glides through my hair as if it weren''t the stiff, stringy horror that it is.$B$BOh, if only I had a mirror...' WHERE `ID` = 26652;
UPDATE `quest_offer_reward` SET `RewardText` = 'I can make a spool of ghost hair thread with this, and have a few strands to spare.  Here are some coins for those extra strands.' WHERE `ID` = 26654;
UPDATE `quest_offer_reward` SET `RewardText` = 'You need some Zombie Juice, do you?  Hmm...that''s some strong stuff - I don''t usually get requests for it.' WHERE `ID` = 26660;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good,  you got the rot blossoms.$B$BI''ll whip up the zombie juice... it''s strong stuff, I warn you.' WHERE `ID` = 26661;
UPDATE `quest_offer_reward` SET `RewardText` = 'Can I help you?' WHERE `ID` = 26666;
UPDATE `quest_offer_reward` SET `RewardText` = 'By the Light... you actually went and got it?$B$BI''m shocked. I suppose I owe you thanks for returning it to the archives.' WHERE `ID` = 26667;
UPDATE `quest_offer_reward` SET `RewardText` = 'This was all you found?$B$BThat''s bad news, I''m afraid...' WHERE `ID` = 26669;
UPDATE `quest_offer_reward` SET `RewardText` = 'A thousand thanks, $n.  You warm an old man''s heart with your foolish-...I mean...with your kindness!$B$BHere you are, friend.  Take this as a token of my gratitude.' WHERE `ID` = 26676;
UPDATE `quest_offer_reward` SET `RewardText` = 'Most superb!  This will work perfectly.  Many thanks!' WHERE `ID` = 26684;
UPDATE `quest_offer_reward` SET `RewardText` = 'At last!  The stargazing device is complete!  Thank you, $n.  Now I can continue my research. . .' WHERE `ID` = 26685;
UPDATE `quest_offer_reward` SET `RewardText` = 'Impressive, $n. It would seem that you are capable enough to handle yourself. Perhaps a more suitable challenge could be found for one of your abilities.' WHERE `ID` = 26688;
UPDATE `quest_offer_reward` SET `RewardText` = 'You performed well against the Shadow Weavers, $n. But even now, years after their first arrival, there seem to be so many to replace the ones we kill.$b$bI will put my faith in Master Carevin. No doubt he will get to the bottom of the problem.' WHERE `ID` = 26689;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excuse me for my cold reception, $n, but as I''m sure you can tell, I am an extremely busy man. I see that you have impressed Calor--and I assure you, that is no small feat--and that he has given his recommendation.$b$bThere are unsavory types afoot, $n, and we can use the help of all who have proven themselves. We battle against demons, the undead, and those who would provide them aid. Be vigilant, be wary, and trust none who would not give aid to our cause.$b$bGlory under the Light.' WHERE `ID` = 26691;
UPDATE `quest_offer_reward` SET `RewardText` = 'We did it, $N.  We''ve started the evacuation.  If we leave soon we''ll leave the Forsaken fleet in the dust.' WHERE `ID` = 26706;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are the help that we requested?$B$B<Althea sighs.>$B$BI suppose you will have to do.' WHERE `ID` = 26728;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n.  Now, let''s see what they''ve got in this elixir of theirs...' WHERE `ID` = 26732;
UPDATE `quest_offer_reward` SET `RewardText` = 'They KILLED him?  And all this time, I thought he had them underneath an iron bootheel...' WHERE `ID` = 26735;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.  It looks like my suspicions were correct... the three prisoners seem to have escaped the affliction that gripped Kurzen and the rest of his men.$b$bBefore you arrived, Emerine teleported them over to Stormwind to get cleaned up after their ordeal.  They promised to return soon.' WHERE `ID` = 26736;
UPDATE `quest_offer_reward` SET `RewardText` = 'Marvelously executed, $n.  My men and I can handle the rest.$b$bWith Kurzen out of the picture, we may be able to continue our original expedition here in Stranglethorn, which was... ahh...$b$bNo matter.  Please, feel free to peruse our armor stores.  You may find something that fits you well.' WHERE `ID` = 26737;
UPDATE `quest_offer_reward` SET `RewardText` = 'To be honest, I''m sending this information home to Stormwind, for my wife and son.  They love to hear about what I''ve been doing out here in the jungle, and I only get to visit so often.  Every little bit helps.$b$bThank you, $n.' WHERE `ID` = 26744;
UPDATE `quest_offer_reward` SET `RewardText` = 'What do we have here?  A young raptor, and her pet $r.  Hah!$b$bMore importantly, what is that skull you have there?  This was no ordinary troll.  He was big...$b$b<Osborn raps on the headcase.>$b$b... and strong, too.  You know, I''ve been meaning to try my hand at some troll magic.  How hard could it be?  Let''s use this strong fellow as a test subject, shall we?' WHERE `ID` = 26745;
UPDATE `quest_offer_reward` SET `RewardText` = 'I heard about the Defias making a return. Terrible news. I wish I had better news, but it would appear that Lakeshire is under attack! We are losing citizens left and right. Our own guards are spread far too thin to handle the situation. We need a hero to step up!' WHERE `ID` = 26761;
UPDATE `quest_offer_reward` SET `RewardText` = 'These will work fine.  Just a moment please.$b$b<Krazek thrusts the stones into the cooking pot and wiggles them around a bit.>$b$bAll fixed!' WHERE `ID` = 26763;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s fixed!  This is great, now I can get dinner started!  Thanks so much, $n.$B$BI hope Krazek didn''t give you too much trouble.' WHERE `ID` = 26765;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is as I suspected.  Zanzil is too haughty to interfere with the squabbles between the Bloodscalps and the Skullsplitters.  No, he is playing a part in a grander scheme... Jin''do the Hexxer is using him to help bring Hakkar back to Zul''Gurub.$b$bIt''s good that we found this out now, because it offers us a simple solution.' WHERE `ID` = 26809;
UPDATE `quest_offer_reward` SET `RewardText` = 'You appear to be too late.  Zanzil has left Aboraz.' WHERE `ID` = 26810;
UPDATE `quest_offer_reward` SET `RewardText` = 'I ask you to slay Zanzil the Outcast, a lowly, hermetic exile of the Gurubashi, and what do you do?  You dash headfirst into the Gurubashi capital and eliminate one of their High Priests!  Very nearly two!  Only one word suffices to explain such a rash and foolhardy endeavor:$b$bHeroism.$b$bJin''do the Hexxer still walks within Zul''Gurub''s walls, but he lost one of his legs when you crushed Jeklik.  Today''s battle is ours.' WHERE `ID` = 26814;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is fascinating!  Just think of all the applications!$b$bThanks again, $n.  Remember, if you ever need anything mixed for you... and I mean ANYTHING... you can always ask The Flask.' WHERE `ID` = 26816;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do you know how hard it is to get fresh water in Stranglethorn?  It''s no wonder that the nagas guard their shrine so ferociously!$b$bAlright, let''s get this mix started!' WHERE `ID` = 26817;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hooray!  It''s been days and days since we last had Akiris reeds!' WHERE `ID` = 26819;
UPDATE `quest_offer_reward` SET `RewardText` = 'These statues are beautiful...$b$bWow, I had no idea the naga were so talented.  Thanks, $n!' WHERE `ID` = 26820;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fascinating!$b$bI''ll need some time to study this.  Why don''t you have a look around Booty Bay and come back later?' WHERE `ID` = 26821;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ahem!  Ahhh... right...$b$bWell done!  And, congratulations, on killing them, I mean.$b$bHere you go.' WHERE `ID` = 26822;
UPDATE `quest_offer_reward` SET `RewardText` = 'Alright!  Step one - getting ingredients - is all done.  Time for the next step: getting more ingredients.' WHERE `ID` = 26823;
UPDATE `quest_offer_reward` SET `RewardText` = 'I knew that alchemist was all talk.  Well, thanks for your help, $n.  I know you tried.' WHERE `ID` = 26824;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done! This is just what we need, $n.' WHERE `ID` = 26901;
UPDATE `quest_offer_reward` SET `RewardText` = 'Take this gift. You have earned my blessing this day.' WHERE `ID` = 26905;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well this day. Charlga''s advisors are as much a threat as any.' WHERE `ID` = 26907;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope that wasn''t too much for you. The mission is far from over!' WHERE `ID` = 26939;
UPDATE `quest_offer_reward` SET `RewardText` = 'Took you long enough. Get behind the pillar with me before you blow our cover!' WHERE `ID` = 26941;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''d love for you to come aboard as a full G-Team Commando, but you have other adventures to pursue.$B$BI''m sure we''ll meet again, and I hope you''ll have considered joining by then. Here''s something for your trouble.' WHERE `ID` = 26942;
UPDATE `quest_offer_reward` SET `RewardText` = 'It looks like Zen''Kiki is still having a little bit of trouble with his shapeshifting.' WHERE `ID` = 26953;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now we''re getting somewhere.  How many birds did Zen''Kiki end up killing?$b$bNone?  You killed them all yourself?$b$bAlright, I suppose we''ll have to find another use for him then.  I will let you know when the time is right.' WHERE `ID` = 26954;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for your help, $n.  I know that picking vegetables isn''t the most heroic task imaginable, but even the humblest tasks have their rewards.' WHERE `ID` = 26956;
UPDATE `quest_offer_reward` SET `RewardText` = 'This will be more than enough, $n.  Now, I will need some time to perform my studies.' WHERE `ID` = 26999;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well, it sounds like they''re certainly afraid of the mustang, but they''re not leaving for good.  I can''t have you running around on a horse forever.  Nor do I think you''d want to.$b$bFine.  Bloodshed it is.' WHERE `ID` = 27000;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ll just put this back over in the lumber stores outside.  Nathaniel probably won''t even notice it was missing.' WHERE `ID` = 27011;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.  I''ll be throwing these in the fire.  We don''t want those gnolls just sneaking in and stealing them back.' WHERE `ID` = 27012;
UPDATE `quest_offer_reward` SET `RewardText` = 'I feel a bit more relieved, $n.  Thank you.' WHERE `ID` = 27013;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was a close one! I can''t believe you stood your ground against so many at once.$B$BIt looks like this site was used for some kind of twisted Twilight''s Hammer initiation ritual. They''re definitely active in Stormwind. What''s this?$B$B<Anduin finds a badge resting on the shrine.>$B$BThis badge shows a crossed axe and hammer. It looks old. If we keep poking around, we might figure out what it means...
' WHERE `ID` = 27060;
UPDATE `quest_offer_reward` SET `RewardText` = '<3 ... 2 ... 1 ...>$B$B<You wet your fingers and snuff out the fuse. The cathedral is saved!>$B$BUnderneath the powder kegs you find a heap of notes and papers. Apparently the cultists were trying to destroy the evidence behind them.>
' WHERE `ID` = 27092;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done well, $C, and for that I am forever in your debt. Though the war is far from over, a great battle has been won against those who would bring about our doom.$B$BPlease - accept this gold as a token of my enduring gratitude. If we ever cleanse Dire Maul, know that you will be welcomed here as a hero. Thank you.
' WHERE `ID` = 27103;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is very troublesome that a water elemental was here, let alone one that powerful. Take this as my thanks for your efforts. I must examine this essence for any knowledge it may contain.' WHERE `ID` = 27105;
UPDATE `quest_offer_reward` SET `RewardText` = 'Samuelson - corrupted by the Twilight''s Hammer? This must have been going on for years. Right here in my very keep!$B$BI am grateful that you and my son were able to get to the bottom of this before my city was brought to harm. I''ve underestimated how much Anduin has grown - his command of the holy light just saved my life, if not the entire kingdom.$B$BAs for you - words alone can''t do justice to your heroism this day. Thank you, $C.
' WHERE `ID` = 27106;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now you watch Master use book to kill stupid trees and stupid goat men! YAR!' WHERE `ID` = 27107;
UPDATE `quest_offer_reward` SET `RewardText` = 'A large, broken trap lies before you.  From the looks of it, the ogres have tried to repair the trap but to no avail.$B$BA hastily written note lies next to the trap, and strangely enough it details exactly how to repair it: just a few simple adjustments ought to do it.  Were the trap repaired, an ogre passing near it might get trapped, and could be avoided.$B$BClearly, it would seem fortuitous that very few ogres know how to read.$B$BClearly.' WHERE `ID` = 27118;
UPDATE `quest_offer_reward` SET `RewardText` = 'Did you notice, $n?  Many names were mentioned, but one name was mentioned far more than the others.$b$bBisp.' WHERE `ID` = 27153;
UPDATE `quest_offer_reward` SET `RewardText` = 'I suppose that we can take his aggression as an admission of guilt.  You alright, $n?' WHERE `ID` = 27154;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m already aware of your actions, $n.  I welcome you into my town, give you my blessing, and what do you do?$b$bYou slay the traitor that we''ve been hunting down for weeks.  Well done.  Your heroism is budding much earlier than even I had anticipated.' WHERE `ID` = 27155;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m just looking over my paperwork here, and it says that we were expecting a $g FEMALE: MALE; $r $c.  You''re not, umm...$b$b<Lieutenant Myner looks at you awkwardly.>$b$bNever mind.  It would appear that you are not the person that I originally hired, but you did a good job.  So I''m going to pay you anyhow.' WHERE `ID` = 27156;
UPDATE `quest_offer_reward` SET `RewardText` = 'Nice work!  In retrospect, I''m glad that other $r $c never showed up... you''ve proven to be all the help I need.' WHERE `ID` = 27157;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s about time you arrived, $C.
' WHERE `ID` = 27158;
UPDATE `quest_offer_reward` SET `RewardText` = 'You may not act quickly, but at least you do not fail me.$b$bVery well.  I will have a more important task for you, $n, when the time is right.' WHERE `ID` = 27159;
UPDATE `quest_offer_reward` SET `RewardText` = 'Abominations... strong.$b$b$n... stronger.' WHERE `ID` = 27160;
UPDATE `quest_offer_reward` SET `RewardText` = 'These grenades are all explosives, nothing more.  I may not be a goblin engineer... but I still understand the value of being able to just explode things every once in a while.' WHERE `ID` = 27161;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellently done, $n.' WHERE `ID` = 27163;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will have my fletchers get to work on these.$b$bI''m glad to see you being so useful right away, $n.  Perhaps later I will have some more exciting tasks for you.' WHERE `ID` = 27166;
UPDATE `quest_offer_reward` SET `RewardText` = 'You hunt like a true $c.  Even if we can''t set up our homesteads... at least we can still eat.' WHERE `ID` = 27167;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hopefully most of them passed on peacefully.  I thank you, $n.' WHERE `ID` = 27168;
UPDATE `quest_offer_reward` SET `RewardText` = 'You and the humans at Chillwind Camp wish to re-take Andorhal?  I wish you luck.' WHERE `ID` = 27169;
UPDATE `quest_offer_reward` SET `RewardText` = 'Attacked by ghosts?  Strange.  I suppose that crypt wasn''t fully healed after all.$b$bYou just missed Thurman Grant... you remember, that oaf of a farmer that was here earlier.  He took his men with him and traveled to the nearest farm... against my orders.' WHERE `ID` = 27171;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well, now that you''re here, we''ll gladly take that armor off your hands.$b$bYou can keep the weapons, though.  These men wouldn''t know which end to hold.' WHERE `ID` = 27172;
UPDATE `quest_offer_reward` SET `RewardText` = 'You fight well, $r.  My men could stand to learn a few moves from an experienced $c like you.' WHERE `ID` = 27173;
UPDATE `quest_offer_reward` SET `RewardText` = 'We can handle things from here.  I thank you for your help, $n.$b$bI assume that when we next meet, it will be in battle.  Take care of yourself until then.  We''ll need all the help we can get.' WHERE `ID` = 27174;
UPDATE `quest_offer_reward` SET `RewardText` = 'For every val''kyr you slay, you save dozens of our men... and prevent the Forsaken forces from growing.$b$bStill, they press on.  We may not win this battle after all.' WHERE `ID` = 27201;
UPDATE `quest_offer_reward` SET `RewardText` = 'You fought valiantly, but we''re getting nowhere.  Every body that falls just fuels their forces.' WHERE `ID` = 27202;
UPDATE `quest_offer_reward` SET `RewardText` = 'I watched your victory from below.  Well-fought, but ultimately, it was for naught.$b$bThe val''kyr and the Forsaken press on; soon, they will overtake us.  We have lost Andorhal.' WHERE `ID` = 27204;
UPDATE `quest_offer_reward` SET `RewardText` = 'Stratholme will become a paragon of all that is good in this world. You have my thanks for your part in this mission.' WHERE `ID` = 27227;
UPDATE `quest_offer_reward` SET `RewardText` = 'I respect the power you demonstrated in killing Ramstein. With proper rage backing your actions, I think even the Scourge can know fear.' WHERE `ID` = 27228;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great! Without a steady flow of their weapons, we''ll win through attrition!' WHERE `ID` = 27230;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent! I think the holy water will prove devastating in large volumes.' WHERE `ID` = 27352;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh my... the banshees are very tortured souls indeed. Merely holding their essence is emotionally painful...$B$BEnough of that for now. I''ll get to work on counteracting their magic, then we''ll have a portal up and running in no time. Stratholme will be ours soon, I just know it.' WHERE `ID` = 27359;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re back?!  Thank the Light!$b$bBefore you throw that acid on me, I need to ask: Are you the $g guy: girl; who was here before, or are you one of those eight-legged cowards?  I need to know whether or not I should smack you on my way out.' WHERE `ID` = 27368;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ll tear that pint-size paladin to shreds before he... wait a minute are those Banshee''s Bells?  You brought these for me?$b$bOh, Gidwin asked you to get them for me!  That sweet little guy.  Alright.  He''s off the hook for now.' WHERE `ID` = 27369;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve found them, $r.  The Scourge.  How I''ve longed for this day.' WHERE `ID` = 27370;
UPDATE `quest_offer_reward` SET `RewardText` = 'Five should be good enough.$b$bYikes, look at the time!  I need to head back to camp.' WHERE `ID` = 27371;
UPDATE `quest_offer_reward` SET `RewardText` = 'Why, this is exactly what I needed!  Fine, I''ll forgive Tarenar for running off.$b$b$n, you''re welcome to join us anytime.' WHERE `ID` = 27372;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hope the ride wasn''t too bumpy for you.$b$bHave a look around the tower while the horses rest.  It''s no Light''s Hope Chapel, but I''m sure you can find some way to keep yourself busy.' WHERE `ID` = 27373;
UPDATE `quest_offer_reward` SET `RewardText` = 'Of course a young $r like you would have no trouble taking care of a few wild animals.  With the roads clear, my journey to the next tower will be much easier.' WHERE `ID` = 27382;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hello.  I''m Pamela, what''s your name?' WHERE `ID` = 27383;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found it!  You found my doll!  Oh, thank you!' WHERE `ID` = 27384;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve seen Pamela?  She''s alive?$B$BShe''s dead?  No!  Oh, Pamela!  Why does your spirit still suffer in this world?  Why are you perished, while fortune keeps me alive?  In an instant I would switch places with you and wander dead Darrowshire, a ghost and alone!$B$BAh, but this news cannot change fate.  Thank you, $n.  Now my duty, my duty to revenge, burns hot as ever.$b$bSay, what is that sword you have there?' WHERE `ID` = 27385;
UPDATE `quest_offer_reward` SET `RewardText` = 'What is this?  A warsword?  A butter knife?  I''m useless when it comes to blades.  Let me see...$B$BAh!  This sword was once in the hand of a great man, but there is much tragedy in that man''s past.$B$BAre you here to help him?  It''s far too late for him now... but perhaps we can help him in the past!' WHERE `ID` = 27386;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your aid is most timely, $n.' WHERE `ID` = 27399;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great, you got him!  And I hope you taught his gang a lesson too!' WHERE `ID` = 27432;
UPDATE `quest_offer_reward` SET `RewardText` = 'Pardon my saying so, but I am surprised you completed the task set out before you alive. Those monsters were responsible for the deaths of countless thousands, a great many of them heroes still spoken highly of to this day.$B$BYou have earned my respect and a reward for your courage.' WHERE `ID` = 27440;
UPDATE `quest_offer_reward` SET `RewardText` = 'What did I tell you, eh? Perfectly safe!$B$BI''ll see about getting some of these over to to your friends, $n. At a discount.' WHERE `ID` = 27536;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fiona has left some of her charms inside the caravan.$b$bAs a trader, she seems to be pretty good with money.  Maybe carrying one of her charms will help out with your finances.' WHERE `ID` = 27555;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t know how I''m still alive. The patrols keep walking past me like I''m not even here.$B$B...Am I dead, $C?
' WHERE `ID` = 27565;
UPDATE `quest_offer_reward` SET `RewardText` = 'I can see it now: our own famous Bogpaddle Lobster-Poppers! Made fresh from the sea! Oh, it''s like this stuff writes itself...$B$BYour help is very much appreciated, my friend. I''ll start seeing if I can''t cut your people a favorable arrangement, eh?' WHERE `ID` = 27587;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our ice-cold, refreshing Silversnap Ice! I can''t thank you enough, "dawg", for this entirely spontaneous act of heroism!$B$BHere, have your very own bottle as a totally sincere gesture of thanks! Be sure to tell ALL YOUR FRIENDS how good it is.' WHERE `ID` = 27592;
UPDATE `quest_offer_reward` SET `RewardText` = 'Silversnap sent you?! I''m DOOMED!$B$BOh, he sent you to help me! That''s different, haha!' WHERE `ID` = 27597;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''ll show those fish-faced freaks! Good work!' WHERE `ID` = 27598;
UPDATE `quest_offer_reward` SET `RewardText` = 'WOW!$B$BI don''t know why I said that. I''m excitable! But man, there was a lot of stuff on these guys, check it out!$B$BHere, you want this?' WHERE `ID` = 27599;
UPDATE `quest_offer_reward` SET `RewardText` = 'My high-grade fuse! My imported blasting powder!$B$BAnd my--hello there! I''ll just be taking that!$B$BThose are all worth more gold than what you''re wearing, you know! Thanks for your help!' WHERE `ID` = 27600;
UPDATE `quest_offer_reward` SET `RewardText` = 'Darn it! I simply HAVE to know what''s behind that gate! This could be the discovery that makes my career, you know!$B$BHmm....maybe a couple good explosions would do the trick...
' WHERE `ID` = 27603;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, good, good! Just what I needed.' WHERE `ID` = 27663;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t worry about the chamber, my boys will check it out! You have more important things to do!' WHERE `ID` = 27672;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is incredible, $n. The power coursing through each core...the contrasting powers so close together!$B$BI''ll take this to the proper dwarves right away. These cores are extremely important!' WHERE `ID` = 27673;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fantastic! Great work! We''ll know all that Dig Three has to tell us in no time at all!' WHERE `ID` = 27676;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, lad! Now go to the discs and learn all you can!' WHERE `ID` = 27677;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have to wonder just what''s out there. This is the coast of the Forbidding Sea, with nothing beyond its reaches... but all these fishy folk just stomped right out of it.$B$BWhat''s more, I saw where they''ve been going...' WHERE `ID` = 27691;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is it!$B$BThese are the bones of my kin...' WHERE `ID` = 27704;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good riddance. Another source of corruption in this world put to rest.$B$BI thank you for your bravery, $n.' WHERE `ID` = 27705;
UPDATE `quest_offer_reward` SET `RewardText` = 'A deserved fate. You will not find the pacifism of the red dragonflight among my kin, $n; we will not suffer the intrusions of mortals.' WHERE `ID` = 27768;
UPDATE `quest_offer_reward` SET `RewardText` = 'Going toe to toe with ogres is impressive, $n. I''m glad I''ve got soldiers like you out here.' WHERE `ID` = 27795;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let''s have a look then...$B$BMmm, oh dear. That''s what I thought these were. They might still be usable, but it''s horrid to have such things in my backyard.' WHERE `ID` = 27818;
UPDATE `quest_offer_reward` SET `RewardText` = 'More black on you than red... that''s what I like to see. Looks like you''ve got what it takes, $n.' WHERE `ID` = 27821;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve had strikes on our own lumber line while you''ve been gone. This should at least put us on equal footing for gathering rates.$B$BGood work, $n.' WHERE `ID` = 27822;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.  We, are in your debt.' WHERE `ID` = 27840;
UPDATE `quest_offer_reward` SET `RewardText` = 'Once again, well done. With a few more pushes the battle will be ours.' WHERE `ID` = 27843;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve followed orders well, $n. On behalf of the crown, I''m rewarding you for your bravery on the battlefield.' WHERE `ID` = 27849;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, $n. With this, it''s only a matter of time until the orcs are fleeing for the portal or begging for surrender.' WHERE `ID` = 27851;
UPDATE `quest_offer_reward` SET `RewardText` = 'It still pains my heart to have asked you to do this, though I know there is no other way. You have saved those of us still holding on from a terrible menace.' WHERE `ID` = 27860;
UPDATE `quest_offer_reward` SET `RewardText` = 'The goblin sent you? She has a cunning eye, that one.$B$BShe speaks the truth. I am here to stem the tide of corruption seeping from this temple. If you would save your people from a wicked fate, $n, I ask for your assistance.' WHERE `ID` = 27869;
UPDATE `quest_offer_reward` SET `RewardText` = 'Trouble within the temple... I wish we could spare forces to deal with it. The war with Stonard is already raging, and we need every man we can get.' WHERE `ID` = 27870;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have performed a great service for me and my kind, $n. Accept this as a symbol of my gratitude, and of your courage.' WHERE `ID` = 27914;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, it''s about time someone came to speak with us on matters most urgent.
' WHERE `ID` = 27953;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will see to it that these dragons are taken care of.' WHERE `ID` = 28172;
UPDATE `quest_offer_reward` SET `RewardText` = 'So you''re in, then?$B$BGood.
' WHERE `ID` = 28174;
UPDATE `quest_offer_reward` SET `RewardText` = 'Those scorpids are easy to underestimate.  You''re lucky you didn''t end up on the end of one of these barbs.  Or maybe you''re just good.$b$bI''ll add these to the stockpile.  We''re not done yet, $r.' WHERE `ID` = 28177;
UPDATE `quest_offer_reward` SET `RewardText` = 'Believe me, $n... I''m just as anxious to get to the killing as you are.  We''ve got to keep to the plan.  The armageddon will come soon enough.$b$bI''ll keep these hides here.' WHERE `ID` = 28178;
UPDATE `quest_offer_reward` SET `RewardText` = 'Gah!  Who are you?$b$bOh, so Keeshan sent you?  Good.  Would ya mind sticking around for a while?  It''s nothing big... I just need you to kill some warlocks for me.' WHERE `ID` = 28180;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope that''s what Keeshan was looking for.  It''s not doing me much good right now, anyhow.' WHERE `ID` = 28181;
UPDATE `quest_offer_reward` SET `RewardText` = 'Knowing the way those orcs operate, there''ll be another one to take his place soon.  I''ll see if I can''t sneak back into the altar before that happens.$b$bThanks, $g buddy: my dear;.' WHERE `ID` = 28182;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, Oilfist sent you?  Hah!$b$bDid he ever tell you how he got the name Oilfist?  You''ll have to ask him about that one sometime.' WHERE `ID` = 28514;
UPDATE `quest_offer_reward` SET `RewardText` = 'The expedition needs your help, $c.' WHERE `ID` = 28709;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID` = 28757;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You''ve turned out to be quite an asset to this garrison. It''s time for you to train!' WHERE `ID` = 28759;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID` = 28762;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID` = 28763;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID` = 28764;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID` = 28765;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID` = 28766;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID` = 28767;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You''ve turned out to be quite an asset to this garrison. It''s time for you to train!' WHERE `ID` = 28769;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You''ve turned out to be quite an asset to this garrison. It''s time for you to train!' WHERE `ID` = 28770;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You''ve turned out to be quite an asset to this garrison. It''s time for you to train!' WHERE `ID` = 28771;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You''ve turned out to be quite an asset to this garrison. It''s time for you to train!' WHERE `ID` = 28772;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You''ve turned out to be quite an asset to this garrison. It''s time for you to train!' WHERE `ID` = 28773;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You''ve turned out to be quite an asset to this garrison. It''s time for you to train!' WHERE `ID` = 28774;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greymane''s right.  These beasts do not give a damn about our politics.$B$BGilneas needs to stand together.' WHERE `ID` = 28850;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID` = 29078;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You''ve turned out to be quite an asset to this garrison. It''s time for you to train!' WHERE `ID` = 29079;
UPDATE `quest_offer_reward` SET `RewardText` = 'What''s this? A stein voucher? So you like drinking? Great! After I give you this stein, go have a few drinks! Then a few more. Maybe have a few more after that... Then, now this is important, come see me.$B$BLook, I know you''ll be back eventually. If you want your Brewfest tokens redeemed you have to see me.$B$BAnyways, here''s the stein, and remember to talk to me later.
' WHERE `ID` = 29396;
UPDATE `quest_offer_reward` SET `RewardText` = 'Not bad, $n. You may indeed have chosen the proper path.$B$BGood. Let us continue.' WHERE `ID` = 29406;
UPDATE `quest_offer_reward` SET `RewardText` = 'The fact that you were able to snatch the flame so easily is no small feat.$B$BThe Edict of Temperance is a scroll of wisdom passed down from my elders'' elders. Wisdom from a more peaceful time.$B$BEvery lesson has its time and place, and with darkness on the horizon, the time for this particular wisdom has passed.$B$BThe burning of the scroll is an acceptance of tidings to come and a promise to action. Your hand carried the flame, and I suspect that it will continue to do so in the future.' WHERE `ID` = 29408;
UPDATE `quest_offer_reward` SET `RewardText` = 'You truly impress, $n. It seems certain that the path of the $c is indeed the path for you.' WHERE `ID` = 29409;
UPDATE `quest_offer_reward` SET `RewardText` = 'You came for Aysa? You... you really shouldn''t interrupt her until she finishes her exercises. She doesn''t speak to anyone until her routine is done.$B$BIn the meantime, could you maybe help me? I had some bad luck with forest sprites.' WHERE `ID` = 29410;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your path is set before you. You will be the one to rekindle the spirit of fire and bring it to the safety of the temple.$B$BThis will not be the only time you and Aysa work together. She is strong and wise. You can trust in her.' WHERE `ID` = 29414;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are too kind, $c.' WHERE `ID` = 29419;
UPDATE `quest_offer_reward` SET `RewardText` = 'Remember always, the superior warrior is modest in his speech, but exceeds in his actions.' WHERE `ID` = 29421;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you! You''re an honorable $c. They''ve taught you well.' WHERE `ID` = 29424;
UPDATE `quest_offer_reward` SET `RewardText` = 'A remarkable find!$B$B<The professor browses the book''s contents.>$B$BSome of these are hard to read, but if even a third of the contents of this journal are true, this is a real treasure. Would you trade it for a generous number of Darkmoon tickets?
' WHERE `ID` = 29458;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are great! They''re just the kinds of pieces the kids will be excited to ''discover''.
' WHERE `ID` = 29507;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good job getting those tonks back online. Here are those tickets I promised.' WHERE `ID` = 29511;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s good to see you again, $n.$B$BThis is the pool of the skunk, as I''m sure you noticed.$B$BOver the many ages of Shen-zin Su, animals have died in some of these magical pools. Through their deaths, their spirits were infused into the waters, and anyone touching those waters will take their form.$B$BThere are several cursed pools here, some more dangerous than others.' WHERE `ID` = 29521;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hello! You look poised and confident... I like that!$B$BI''ve heard some rather impressive whispers about you from the training grounds. If you''re half as capable as they say, I think you and I are going to be good friends!' WHERE `ID` = 29522;
UPDATE `quest_offer_reward` SET `RewardText` = 'You know what it is to seize opportunity. I think you and I are kindred spirits, $n.' WHERE `ID` = 29523;
UPDATE `quest_offer_reward` SET `RewardText` = 'Intriguing, my young pupil.$B$BMost of the other trainees have been here for quite some time, but you are able to match them even within this first hour.$B$BThis speaks well of you, but there are yet other lessons I would see you learn.' WHERE `ID` = 29524;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are friends of Taretha? So this is her new plan? Very well then...' WHERE `ID` = 29598;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done a great thing, $n. Alas, the young warchief''s memory of these events must be as they originally were...' WHERE `ID` = 29599;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done well, $n. But more work remains to be done.' WHERE `ID` = 29657;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have my gratitude, $n.' WHERE `ID` = 29658;
UPDATE `quest_offer_reward` SET `RewardText` = 'They were going to die to the creatures contained here soon even without our interference. It is for the greater good.' WHERE `ID` = 29660;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. You''re a quick study.' WHERE `ID` = 29661;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good.$B$BNo number of reeds have ever withstood my might.$B$BStep back, and let me dispel your doubts.' WHERE `ID` = 29662;
UPDATE `quest_offer_reward` SET `RewardText` = 'Even now, your skills increase. Your footing becomes more sure. Your blows strike with more force.$B$BDiscipline and practice are the keys to reaching our full potential.' WHERE `ID` = 29663;
UPDATE `quest_offer_reward` SET `RewardText` = 'These fires will give you the strength that you''ve not yet obtained. They will illuminate your potential.' WHERE `ID` = 29664;
UPDATE `quest_offer_reward` SET `RewardText` = 'Creatures of the void are naturally chaotic. They are a necessary part of the universe, but they must be kept in check by the Light.' WHERE `ID` = 29674;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion seeks only to consume. They hold no regard for the balance.' WHERE `ID` = 29675;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have to admit, that looked pretty fun from my angle.$B$BAnd you seem to have made a new friend.
' WHERE `ID` = 29679;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. Your actions this day have prevented countless tragedies.' WHERE `ID` = 29681;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are the only survivors, $n?$b$bSo be it. We will play the hand fate has dealt us.$b$b<Gorrok lifts his head up high.>$b$bNumbers be damned. This is where heroes are made.' WHERE `ID` = 29694;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good.$B$BMy head, it is harder than the densest wood.$B$BStep back, and let me dispel your doubts.
' WHERE `ID` = 29771;
UPDATE `quest_offer_reward` SET `RewardText` = 'Huh... well... that''s definitely the ringing I expected, but I was hoping for a bit more from Wugou. This guy''s a deep sleeper, that''s for sure.$B$BIt''s alright, $n. I''ve got another idea, and there''s not much preparation needed at all - just how I like it.
' WHERE `ID` = 29772;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done well, young student. Three of the four spirits have been returned to the temple. We are closer to the answers we seek.
' WHERE `ID` = 29775;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re a good man, $n. You have proven that again and again, and I am glad to stand beside you.
' WHERE `ID` = 29778;
UPDATE `quest_offer_reward` SET `RewardText` = 'Invigorating! A good fight always makes me feel better!' WHERE `ID` = 29779;
UPDATE `quest_offer_reward` SET `RewardText` = '$n, I''m thinking we should celebrate with these later. What do you think?' WHERE `ID` = 29781;
UPDATE `quest_offer_reward` SET `RewardText` = 'GOOD! A true challenge. Let us put this pillar to the test!' WHERE `ID` = 29782;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good.$B$BMy head, it is harder than the strongest stone.$B$BStep back, and let me dispel your doubts.
' WHERE `ID` = 29783;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m impressed. Most students that are even capable of reaching this spot do so soaking wet.' WHERE `ID` = 29784;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have helped Dafeng, the spirit of air, find his courage! The final spirit has been restored.' WHERE `ID` = 29786;
UPDATE `quest_offer_reward` SET `RewardText` = 'I do not have the strength of body or will that I once did. I''m glad there are noble pandaren like you to fight on for our people. You''ve come far, $n.' WHERE `ID` = 29787;
UPDATE `quest_offer_reward` SET `RewardText` = 'You come through, as you always have. You are truly one of my greatest students. I think you will be something the likes of which the world has never seen.' WHERE `ID` = 29789;
UPDATE `quest_offer_reward` SET `RewardText` = 'I know, $n... I know. Such is the way of things.' WHERE `ID` = 29790;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have undergone a great honor, $c. Have you come back wiser for it?' WHERE `ID` = 29791;
UPDATE `quest_offer_reward` SET `RewardText` = 'Evil is rising from the seas and filling the forest. It''s not just tigers anymore... something far more sinister lurks in the shadows, waiting to take any pandaren unwise enough to stray out alone.$B$BYou are not safe here.' WHERE `ID` = 29792;
UPDATE `quest_offer_reward` SET `RewardText` = 'You make me proud, $n. You make all of us proud.' WHERE `ID` = 29793;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have no idea who you people are, but fate surely smiled on us this day. Many more would be dead if not for the help of you and your friends. I am in your debt.' WHERE `ID` = 29794;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are excellent! We''ll have them crafted into weapons in no time.' WHERE `ID` = 29795;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your friend is out fighting to save my crew. Fiercely I might add. I''m afraid your message may have to wait.' WHERE `ID` = 29796;
UPDATE `quest_offer_reward` SET `RewardText` = 'These will do perfectly. I''ll get my medics to work immediately.$B$BThank you.' WHERE `ID` = 29797;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to see you again, $n. You''ve done all that I''ve asked of you and more... you have saved Shen-zin Su.$B$BYou make an old master proud.' WHERE `ID` = 29800;
UPDATE `quest_offer_reward` SET `RewardText` = 'This crate should be full of supplies...' WHERE `ID` = 29821;
UPDATE `quest_offer_reward` SET `RewardText` = 'How did you find me?$B$B<Anduin listens to you describe the vision from the Dream Brew.>$B$BRemarkable! That''s exactly what happened several days ago. We''ve been laying low since then.' WHERE `ID` = 29890;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is an amazing specimen! I am quite shocked that you have succeeded, actually.' WHERE `ID` = 29891;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do you have crocolisks where you are from?' WHERE `ID` = 29892;
UPDATE `quest_offer_reward` SET `RewardText` = 'Beautiful color, rare transparency, shimmer but not sparkle...these will do quite well.$B$BI am beginning to see great potential in you, strange one.' WHERE `ID` = 29893;
UPDATE `quest_offer_reward` SET `RewardText` = 'The healing waters should abate Ren''s fever for a short while, but alas, I fear it is no permanent cure.$B$BThank you, $c. We have granted him a little more time, at least.' WHERE `ID` = 29898;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you... friend. I am... happy... knowing... the spirits... are at peace.' WHERE `ID` = 29899;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh... it is the poem! Did you... read it? What did you learn about the Vale?' WHERE `ID` = 29900;
UPDATE `quest_offer_reward` SET `RewardText` = 'He did WHAT?!?!?$B$BHe''s lucky that I haven''t found him yet, because when I do, I just might kill him myself!$B$BWhatever he thinks he''s doing... chasing after this Vale... it is not behavior fit for a prince!$B$BIf we didn''t have more pressing matters at hand, I would send our entire fleet chasing after his heels!' WHERE `ID` = 29901;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your deeds have sparked a long forgotten memory I have of an ancient prophecy. This deserves investigation.$b$bIn order to investigate, I need jade though. I have instructed Toya to gather as much as he can find and give it to you when he is done. Bring it to me and we will see about deciphering the ancient "Emperor''s Omen."$b$bWhile he gathers the jade, feel free to explore. You may find the people of this town are in need of a person of your caliber. ' WHERE `ID` = 29922;
UPDATE `quest_offer_reward` SET `RewardText` = 'A fine weapon. It should suit your needs well.$B$BNow let''s put it to use.' WHERE `ID` = 30033;
UPDATE `quest_offer_reward` SET `RewardText` = 'Congratulations! It''s a beautiful hatchling of your own.$B$BPlease take care of it, $n.' WHERE `ID` = 30142;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today, we become brethren. Congratulations on joining the Order of the Cloud Serpent. Let us ride together!
' WHERE `ID` = 30188;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hey! Where''d you get that? I thought they were out of plainshawk!$B$BAndi asked you to get this for me? Huh. Maybe I underestimated that kid.
' WHERE `ID` = 30475;
UPDATE `quest_offer_reward` SET `RewardText` = 'Throm-Ka, $n!$B$BI hope you were able to gather useful information while on your journey through the forest.$B$BOur preperations are almost complete, but your help is needed.
' WHERE `ID` = 30499;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well... we are alive, and that is better than we could have hoped for without your help.

But, if this is truly to become a base of operations for you, and if we are to join your Alliance, there is one more thing you must do to guarantee our security.' WHERE `ID` = 30512;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did it! At the very least, we have justice, and safety, though in the process we have lost so much.

Regardless, it has been decided. We will join the Alliance, and with your help, rebuild this village.' WHERE `ID` = 30514;
UPDATE `quest_offer_reward` SET `RewardText` = 'Korga sent you, eh? Well, I wouldn''t mind doing a number on that ship for my own reasons anyway, but it''s going to take some work.$B$BGive me a moment to think...' WHERE `ID` = 30589;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $C. I am cleansed of all hatred.$B$BKnow that you are a hero of the Shado-Pan.
' WHERE `ID` = 30757;
UPDATE `quest_offer_reward` SET `RewardText` = 'The first step is done, but now we must save Shen-zin Su!' WHERE `ID` = 30767;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ahh... My cousin is wise to be worried... I am not well...' WHERE `ID` = 30816;
UPDATE `quest_offer_reward` SET `RewardText` = 'Pity that those two did not learn their lesson yet. No matter. In time I am sure they will come to see wisdom.$B$BIn the meantime, congratulations on your victory.
' WHERE `ID` = 30881;
UPDATE `quest_offer_reward` SET `RewardText` = 'Pandaren... you''re here.$b$bGood.' WHERE `ID` = 30987;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve more than proven your worth, in battle and in heart. Few would be willing to leave their homeland to join the Alliance. Fewer still would be willing to face the King of Stormwind in combat.$b$bYou, and the rest of your people, are welcome among our ranks. Welcome to the Alliance, $n.' WHERE `ID` = 30989;
UPDATE `quest_offer_reward` SET `RewardText` = 'It would seem that the dark shaman experiments drove Gordoth insane.$b$bHopefully we''ve seen the last of this, $n.' WHERE `ID` = 30996;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, $n. Who knows what kind of destruction those beasts would have caused.
' WHERE `ID` = 30997;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, $n. Now we can figure out what it is they were trying to achieve down here.' WHERE `ID` = 30998;
UPDATE `quest_offer_reward` SET `RewardText` = 'Look at that!$b$bThese supplies should keep us kickin'' for a few more days.$b$bAnd my boots! Ya managed not to blow ''em up. Way ta go, $n!' WHERE `ID` = 31112;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ho ho, what''s this?$B$B<Uncle Gao jiggles his fat brew belly at the sight of the family''s recipes.>$B$BOoh, I knew I was adding too much corn!
' WHERE `ID` = 31324;
UPDATE `quest_offer_reward` SET `RewardText` = 'A giant creature made of brew?! Who could have imagined such a thing?$B$BYou have my thanks for saving Gao from his own misguided brewing experiments.
' WHERE `ID` = 31327;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have defeated the Sha of Violence and saved the monastery. You have my respect.$B$BPerhaps we were wrong about your people, $n.
' WHERE `ID` = 31342;
UPDATE `quest_offer_reward` SET `RewardText` = 'While I am sad to hear the fates of Wise Mari and Priestess Flameheart, you have my heartfelt thanks.
' WHERE `ID` = 31355;
UPDATE `quest_offer_reward` SET `RewardText` = 'I never doubted you. Funny though, you don''t look any wiser.$B$B<The master winks.>
' WHERE `ID` = 31356;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will find a better hiding place for the four relics.$B$BPandaria is indebted to you, $n.
' WHERE `ID` = 31357;
UPDATE `quest_offer_reward` SET `RewardText` = 'Truly a fight for the ages.$B$BI''m glad that you''re on our side, $n.
' WHERE `ID` = 31360;
UPDATE `quest_offer_reward` SET `RewardText` = 'Outstanding, $n. Your timing couldn''t have been better!
' WHERE `ID` = 31363;
UPDATE `quest_offer_reward` SET `RewardText` = 'So you wish to test your skills? Very good, $R.
' WHERE `ID` = 31380;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hello, $c! We have been granted an audience with the White Tiger. The Vale of Eternal Blossoms was recently savaged by our Warchief, and we are arguing that both the Alliance and Horde should be permitted back inside to repair the damage.$b$bThe Vale is a sacred place. I believe my wife Leza saw it in a vision - it''s what brought my people to Pandaria. We must save it!$b$bDo you think we will be allowed inside?' WHERE `ID` = 31393;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did it, $n!$b$bThe White Tiger has agreed to allow us to accompany the Pandaren into the Vale of Eternal Blossoms. An Alliance outpost is already set up within. Now, the hard work of cleaning up the damage can begin!' WHERE `ID` = 31394;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did it, $n!$B$BThe White Tiger has agreed to allow us to accompany the Pandaren into the Vale of Eternal Blossoms.$B$BWhere the Alliance Prince failed, a hero of the Horde prevailed.
' WHERE `ID` = 31395;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great start, $p!$B$BIt won''t be long now before the Scarlet Crusade is nothing more than an ugly footnote in the annals of history.' WHERE `ID` = 31490;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah yes!$B$B<The Hooded Crusader rubs her hands together gleefully at the sight of the codex.>$B$BAnd now, I have a checklist with the name of every Scarlet Crusader on it!$B$BYou know... just in case any of them are unaccounted for. I don''t like loose ends.' WHERE `ID` = 31493;
UPDATE `quest_offer_reward` SET `RewardText` = 'With Whitemane gone for good, the Scarlet Crusade is finished. It''s just a matter of sweeping up the refuse.$B$BThank you, $p. Not just for myself, but for everyone opposed to mindless hatred and bigotry.$B$BAnd, thank you for these two new blades. Anointed anew in her blood, they should serve me well as I take the fight to Scholomance and deal with Darkmaster Gandling.$B$BI bid you adieu for now.' WHERE `ID` = 31514;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see... an excellent choice. You''re on your way to building up a great team!$B$BRemember, you have the opportunity to catch any pet you can fight, so go ahead and try to get as many as you can during your adventures.
' WHERE `ID` = 31550;
UPDATE `quest_offer_reward` SET `RewardText` = 'Nice work, $n! You''re better with those pets than I thought!
' WHERE `ID` = 31588;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see... an excellent choice. You''re on your way to building up a great team!$B$BRemember, any pet you can fight, you can catch, so go ahead and try to get as many as you can during your adventures.
' WHERE `ID` = 31590;
UPDATE `quest_offer_reward` SET `RewardText` = 'The best thing about killing Alliance in Pandaria? It''ll be months before they get any reinforcements.$b$bThis land will belong to the Horde, $c. We''re nearly finished.' WHERE `ID` = 31775;
UPDATE `quest_offer_reward` SET `RewardText` = 'Blood and thunder, $n. Blood and thunder.' WHERE `ID` = 31776;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope those ding-dongs enjoyed the party you threw for them!' WHERE `ID` = 31777;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today, we become brethren. Congratulations on joining the Order of the Cloud Serpent. Let us ride together!
' WHERE `ID` = 31810;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today, we become brethren. Congratulations on joining the Order of the Cloud Serpent. Let us ride together!
' WHERE `ID` = 31811;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great job $n. Next up, catching your own pets!
' WHERE `ID` = 31827;
UPDATE `quest_offer_reward` SET `RewardText` = 'We may have won the battle against the Alliance, but we won''t get any further with this many jabbering monkeys on our perimeter.$b$bThe hozen are our next target.' WHERE `ID` = 31999;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are now ready to learn more...
' WHERE `ID` = 32310;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done more for this world than you can know, $C. It is... something of a shame Kanrethad met this end. A shame, but inevitable.
' WHERE `ID` = 32325;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our champions defeated the first wave of attackers, but the command ship is nearly upon us!
' WHERE `ID` = 32442;
UPDATE `quest_offer_reward` SET `RewardText` = 'Too many, not enough, no no...give them to Ku''ma...
' WHERE `ID` = 32615;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m grateful for your efforts here, $n. We would have lost so much had you not disarmed those bombs in time.
' WHERE `ID` = 32635;
UPDATE `quest_offer_reward` SET `RewardText` = 'You sailed through the air so... so... majestically! Well done!
' WHERE `ID` = 32839;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve got a real knack for beating up robots, $n.
' WHERE `ID` = 32851;
UPDATE `quest_offer_reward` SET `RewardText` = 'You again? Not eaten by ogres or killed by Thunderlords yet? Ha!
' WHERE `ID` = 32979;
UPDATE `quest_offer_reward` SET `RewardText` = 'I came seeking aid from the elements. I see now that we are the ones who must aid them.$B$BCome, $n, witness what I have witnessed.
' WHERE `ID` = 32980;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done well, $C.$B$BWe will need the aid of these children when the time comes to rescue Exurotus.
' WHERE `ID` = 32983;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is ancient magic, from a time before the orcs. It will not be easy to undo.
' WHERE `ID` = 32984;
UPDATE `quest_offer_reward` SET `RewardText` = 'With Kron defeated I can finish breaching the magic that holds Exurotus, but I may be too late. So much of the fury has already been expended and drained by the magnaron and goren.$B$BI fear we may have only bought this spirit a peaceful death.
' WHERE `ID` = 32985;
UPDATE `quest_offer_reward` SET `RewardText` = 'You bring honor to the clan by giving my family a proper burial, $n.' WHERE `ID` = 33125;
UPDATE `quest_offer_reward` SET `RewardText` = 'May the stars smile upon you, $n.
' WHERE `ID` = 33133;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our precious Vale of Eternal Blossoms. So much destruction and violence. But... I sense a glimmer of hope.
' WHERE `ID` = 33138;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh wow, that thing is really meaty! Think of the soup I could make with it! Here, I will give you some timeless coins for it.
' WHERE `ID` = 33234;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is so... spongy! Hmm, yes, perhaps a little soy sauce and some oil... Here, take these coins as payment!
' WHERE `ID` = 33235;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thanks for the flanks! Ha ha, just a little food humor for you. Here are some coins for not groaning!
' WHERE `ID` = 33236;
UPDATE `quest_offer_reward` SET `RewardText` = 'The stripes on this haunch are so interesting, I wonder how they will cook? First I am going to have to tenderize it a bit, though. Time to beat some meat! Here is a little something for your troubles!
' WHERE `ID` = 33238;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have never seen one of those before, where in the world did you get it? It is so beautiful, I am not sure I can bear to break it open. Just kidding, this is going to make the best omelet! Here is a bunch of coins!
' WHERE `ID` = 33239;
UPDATE `quest_offer_reward` SET `RewardText` = 'At last, that vicious beast has been slain! Thank you.
' WHERE `ID` = 33354;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, commander. I shall see what forces we can dispatch to the area for further clean-up.
' WHERE `ID` = 33427;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done well, but this is only half of the battle. With his support structure in disarray it is time to strike at Death Speaker Blackthorn.' WHERE `ID` = 33513;
UPDATE `quest_offer_reward` SET `RewardText` = 'A job well done, $n. With Amnennar''s phylactery now protected by the Red dragonflight we can now rest at ease.' WHERE `ID` = 33514;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, but we need to move quickly before the plants realize the way is open...' WHERE `ID` = 33662;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am Seer Malune, the great keeper of memories. It is an honor to finally meet you.
' WHERE `ID` = 33871;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh thank you! Now these little peachicks can be moved to safety.' WHERE `ID` = 33882;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re so brave! I could never have taken Sher''khaan out on my own!$b$bNow I only have to worry about the scary orcs, giant birds, hippos, big bird men, spiders, everything being on fire...$b$bYa''know maybe I shouldn''t be out here all by myself...' WHERE `ID` = 33884;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wonderful. That should slow down the attack.$B$BOur forces should be able to retake the forest quickly.' WHERE `ID` = 33905;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. I''m sure Orac will think twice before he strays from the pack again.
' WHERE `ID` = 33915;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh thank you, $gmister:ma''am;! I can''t believe Sher''khaan got Ricky!$b$bYou''re my hero!' WHERE `ID` = 33944;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done well, $c.$b$bNow before we can continue our assault we need to look for any supplies in the area that could help our fight.' WHERE `ID` = 34066;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hrm, yes these spears look pretty good.$b$bNot bad! I know just what to use these for!' WHERE `ID` = 34069;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done $n! The removal of the Sky Riders takes the heat off us for a bit. Keep your weapon in hand though, we''re not done with them yet.
' WHERE `ID` = 34070;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ugh, those smell awful! No, I don''t need to see them. I''ll take you at your word that you have them all.$b$bLet''s get a move on before another Thunderlord patrol stumbles upon me.' WHERE `ID` = 34072;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good job $n, I was able to use the commotion from your work to sneak into the camp.$B$BNow we have only one thing left to do.
' WHERE `ID` = 34073;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you,$n.$B$BI wish we could bring him back just to kill him again but I guess this will suffice.$B$BI hope the spirit of my little one will now know peace.
' WHERE `ID` = 34075;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work,$n!$B$BSeeing Frostwolf banners standing proudly over our crushed foes fills me with pride!$B$BLet them forever fear the wrath of the Frostwolves!
' WHERE `ID` = 34102;
UPDATE `quest_offer_reward` SET `RewardText` = 'Unfortunate that there are those that would pervert such noble creatures.$B$BYou have honored their family once more, $n. They will not forget.$B$BNow it is time to take the fight directly to the Shadow Council.' WHERE `ID` = 34227;
UPDATE `quest_offer_reward` SET `RewardText` = 'We haven''t seen these creatures here in a generation.$B$BTheir sudden appearance and the shaking of the ground are most definitely connected.' WHERE `ID` = 34228;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve heard of these strange Pale orcs you saw. They sound like the Warsingers of Nagrand. But no, that cannot be....$B$BAs for the ogre, his name is Cho''gall. You should kill him if you get the chance. He brings nothing but destruction in his wake.' WHERE `ID` = 34229;
UPDATE `quest_offer_reward` SET `RewardText` = 'We should have killed them all at the Dark Portal in the beginning and damn the consequences.' WHERE `ID` = 34277;
UPDATE `quest_offer_reward` SET `RewardText` = 'For what they''ve done, it is not enough.$B$B$n, when you find their base, you salt the earth.' WHERE `ID` = 34278;
UPDATE `quest_offer_reward` SET `RewardText` = 'A heart? How touching.$B$BQuickly. We must use it to destroy the fel crystals and get to Gul''dan.' WHERE `ID` = 34291;
UPDATE `quest_offer_reward` SET `RewardText` = 'Necessary business. We don''t dare risk letting them grow more powerful.' WHERE `ID` = 34292;
UPDATE `quest_offer_reward` SET `RewardText` = 'Unfortunate, but not surprising. At least we were able to defeat one of the inner council members.$B$BAll is not lost, $n. We know what the Shadow Council is up to and where they''re heading.$B$BWe''ll regroup in Talador. Together, we''ll put an end to Teron''gor and his plans for Auchindoun.$B$BDid you hear that?...' WHERE `ID` = 34295;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings, $C. You''re the commander that Choluna mentioned?$B$B$B$BGood.
' WHERE `ID` = 34335;
UPDATE `quest_offer_reward` SET `RewardText` = 'I knew you were the right person for this job, $n. I just love results.
' WHERE `ID` = 34336;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh my, what an interesting variety! It appears that the goren will eat... anything!
' WHERE `ID` = 34339;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, my! Amazing! This caldera is hotter than hot! Thank you, $n.
' WHERE `ID` = 34340;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. We will keep the artifact safe here, in your garrison.
' WHERE `ID` = 34341;
UPDATE `quest_offer_reward` SET `RewardText` = 'These orders come straight from the leader of the Burning Blade!$B$BI''ve heard of her... the fierce orc with the blade that thirsts for death.$B$BYou''ve done well to bring this to me, $n.
' WHERE `ID` = 34347;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. You are proving to be a great ally.
' WHERE `ID` = 34365;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. The arcane essence you''ve collected will do nicely. All we need now is a suitable crystal to attune...' WHERE `ID` = 34403;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for getting the workers our of the mine safely, $n.' WHERE `ID` = 34406;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is sad to see such a mighty creature fall, but An''dure was a danger to all within the mine. The heart of the crystal giant will aid us in restoring peace to the Jorune Mine.' WHERE `ID` = 34415;
UPDATE `quest_offer_reward` SET `RewardText` = 'A wise elder of my order once told me, "True power is the strength to act and the wisdom to know when not to act." May those words and the memory of Kaelynara stay with you on your journey, $n.' WHERE `ID` = 34447;
UPDATE `quest_offer_reward` SET `RewardText` = 'A wise elder of my order once told me, "True power is the strength to act and the wisdom to know when not to act." May those words and the memory of Kaelynara stay with you on your journey, $n.' WHERE `ID` = 34448;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have accomplished great things on this island today, $n. I look forward to the day we hunt again.
' WHERE `ID` = 34450;
UPDATE `quest_offer_reward` SET `RewardText` = 'The controller breaks in your hands.$b$bExposing this weakness will definitely make the Iron Horde rethink their tactics for controlling the Rylak.' WHERE `ID` = 34455;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hmm. This staff looks familiar. I wonder...$b$bYou did the right thing bringing it to me. I will investigate further!' WHERE `ID` = 34466;
UPDATE `quest_offer_reward` SET `RewardText` = 'Perfect, they will have to concentrate more on base defense now.  Hopefully things will get back to normal out there.' WHERE `ID` = 34572;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good size chunks and without a lot of the matrix material on them.$b$bThese will do just fine.' WHERE `ID` = 34577;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you boss, this is just what I needed.$b$bBy the way, Goren gas is rather difficult to come by. We should probably hold off on clearing those guys out till we can stockpile enough.$b$bJust a thought.' WHERE `ID` = 34579;
UPDATE `quest_offer_reward` SET `RewardText` = 'The base is significantly more secure with that giant dead.$b$bYou have made quite an impression on the peacekeepers.' WHERE `ID` = 34585;
UPDATE `quest_offer_reward` SET `RewardText` = 'This isn''t quite what they taught me in Dalaran, but it''ll have to do!
' WHERE `ID` = 34609;
UPDATE `quest_offer_reward` SET `RewardText` = 'Perfect! We should have plenty of energy now.
' WHERE `ID` = 34619;
UPDATE `quest_offer_reward` SET `RewardText` = 'Kalaam sent you? By the Light, I knew I could count on him!
' WHERE `ID` = 34685;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Laughing Skull sent you? If they were any other clan I would find that ironic.$b$bI am Kash''drakor, hero of the Frostwolf clan, and champion of the slave pits of Stonemaul.$b$bAnd yet, despite all these titles, I need your help.' WHERE `ID` = 34697;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have shown more honor in this one act than I have seen in many years.$b$bWhen this is over, I will swear my axe to your forces and pass my knowledge on to your troops.' WHERE `ID` = 34698;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, strange one. Now we are free to split that chieftain Kor''gall wide open!' WHERE `ID` = 34699;
UPDATE `quest_offer_reward` SET `RewardText` = 'This deed will never be forgotten as long as I or my son live. You have my gratitude, hero, and my loyalty.' WHERE `ID` = 34700;
UPDATE `quest_offer_reward` SET `RewardText` = 'Me watch you from afar. Me like your fighting skills, show much promise.' WHERE `ID` = 34702;
UPDATE `quest_offer_reward` SET `RewardText` = 'This blade has caused enough pain and suffering for one lifetime. We shall see to it that it is properly disposed of.' WHERE `ID` = 34703;
UPDATE `quest_offer_reward` SET `RewardText` = 'You do not have the look of a Stonemaul bounty hunter.$b$bWe escaped the clutches of their vile arena but at a heavy cost. We were forced to leave too many allies behind and too many ogres breathing.$b$bWe could use a fresh face, one that is unknown to the ogres.' WHERE `ID` = 34704;
UPDATE `quest_offer_reward` SET `RewardText` = 'We can finally connect your tower to the ley line network with this crystal.$B$BI also edited your blueprint so you can actually read the thing. Should make building another one much easier.
' WHERE `ID` = 34711;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am Seer Malune, the great keeper of memories. It is an honor to finally meet you.
' WHERE `ID` = 34721;
UPDATE `quest_offer_reward` SET `RewardText` = 'Gonna have to ask demself, "Did Dagg get catched or did Dagg catched dem?"$B$BBig hero been blowin'' Dagg''s cover! But you special, Dagg tinks. Dagg is master of dis guys and want to join you.$B$BDagg is unanimous in dis.
' WHERE `ID` = 34733;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am without a clan. The Burning Blade are dead to me. Perhaps someday I will create a clan of my own.$B$BIn the meantime, it would be an honor to fight at your side. You freed me and fought well.$B$BThere is much we could learn from each other. What do you say?' WHERE `ID` = 34747;
UPDATE `quest_offer_reward` SET `RewardText` = 'They came at us... from... nowhere.$B$B<The stoneguard nearly passes out.>
' WHERE `ID` = 34794;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, a thousand times thank you.' WHERE `ID` = 34802;
UPDATE `quest_offer_reward` SET `RewardText` = 'Nice to meet you.$B$BI am Magister Serena. Frost mage extraordinaire!
' WHERE `ID` = 34815;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now we can tackle getting that artificial nexus for your tower.
' WHERE `ID` = 34875;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for the report, $n. We must keep a close eye on these southern wilds.' WHERE `ID` = 34897;
UPDATE `quest_offer_reward` SET `RewardText` = 'They''re not amazing, but I do think these have some worth to us.
' WHERE `ID` = 34909;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that they''re out of the way, Morkurk is exposed.
' WHERE `ID` = 34910;
UPDATE `quest_offer_reward` SET `RewardText` = 'Destroying those wards was key to our success. Well done indeed!
' WHERE `ID` = 34911;
UPDATE `quest_offer_reward` SET `RewardText` = 'Looks like Morkurk was no match for the two of us, huh?
' WHERE `ID` = 34912;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have the scroll of mass teleportation ready, but we can''t use it just yet. We must take proper precautions to ensure our success.
' WHERE `ID` = 34913;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, these will do nicely as an offering to the Raven Mother! May she feast upon our enemies!' WHERE `ID` = 34939;
UPDATE `quest_offer_reward` SET `RewardText` = 'These orders appear to have come from Orgrim Doomhammer.' WHERE `ID` = 34948;
UPDATE `quest_offer_reward` SET `RewardText` = 'Who are you?$B$BDon''t you know death by sight, $c?' WHERE `ID` = 34951;
UPDATE `quest_offer_reward` SET `RewardText` = 'You done us a solid with them Burning Blade, $g lad:lass;, and we''re not the forgettin'' kind.$B$BLet''s celebrate o''er a pint in an hour. Drinks are on me.' WHERE `ID` = 34952;
UPDATE `quest_offer_reward` SET `RewardText` = 'If you can defeat Luhk, then perhaps there''s some hope for you after all.' WHERE `ID` = 34954;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t expect you to understand the importance of what you''ve done.$B$BPerhaps one day you will.' WHERE `ID` = 34955;
UPDATE `quest_offer_reward` SET `RewardText` = 'You made it. Good.$B$BGetting in here was nothing compared to what''s to come.' WHERE `ID` = 34956;
UPDATE `quest_offer_reward` SET `RewardText` = 'A great victory over the Burning Blade!$B$BThis new Warlord Azuka Bladefury sounds formidable. We''ll have to keep an eye on her and her blademasters.' WHERE `ID` = 34957;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve had quite the journey in getting your tower up to speed. If it''s agreeable to you, I''d like to join your campaign here.
' WHERE `ID` = 34993;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done much to help my little nest of forgotten ones. The poor creatures are not quite sane but with their own kin hunting them I pity their plight.$b$bTheir flying kin, the Adherents you call them, would see the forgotten ones destroyed and my children made into slaves.$b$bThis I must not allow!' WHERE `ID` = 35009;
UPDATE `quest_offer_reward` SET `RewardText` = 'Watch them burn!' WHERE `ID` = 35035;
UPDATE `quest_offer_reward` SET `RewardText` = 'That half-orc burned my toes!' WHERE `ID` = 35036;
UPDATE `quest_offer_reward` SET `RewardText` = 'They are enslaving gronn? This is an even bigger problem than it might seem.' WHERE `ID` = 35037;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good that you still have your wits about you. You do... have your wits about you?' WHERE `ID` = 35041;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s good to see you, commander. When I''d heard about your garrison caravan being destroyed....$B$BWell, let''s just say that I feared the worst.$B$BWhat word from Telaari Station?
' WHERE `ID` = 35059;
UPDATE `quest_offer_reward` SET `RewardText` = 'Commander $n.$B$B<Uruk Foecleaver looks at you and grins.>$B$BTerms of surrender? Hmm... let me think.' WHERE `ID` = 35060;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, commander. I thought we were done for sure.' WHERE `ID` = 35067;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s the beast''s collar? I heard its howls all the way over here!' WHERE `ID` = 35069;
UPDATE `quest_offer_reward` SET `RewardText` = 'These will do nicely, $n! Thank you!
' WHERE `ID` = 35072;
UPDATE `quest_offer_reward` SET `RewardText` = 'These will do nicely, $n! Thank you!
' WHERE `ID` = 35073;
UPDATE `quest_offer_reward` SET `RewardText` = 'These will do nicely, $n! Thank you!
' WHERE `ID` = 35075;
UPDATE `quest_offer_reward` SET `RewardText` = 'Most people cannot handle ogron in single combat.' WHERE `ID` = 35128;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have the notes. Let us see what they reveal about our enemy''s strategy.' WHERE `ID` = 35129;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, $n. We can use this artifact against the Iron Horde when the time is right.' WHERE `ID` = 35136;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that we have the trainers, we can start training your forces to do something other than chop lumber. Heh heh.' WHERE `ID` = 35137;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. We know where we must go to acquire the artifact.' WHERE `ID` = 35139;
UPDATE `quest_offer_reward` SET `RewardText` = 'Outstanding.$B$B<Vindicator Yrel beckons you closer so that the two of you can conspire.>' WHERE `ID` = 35140;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wait a minute, $n... let''s be reasonable. I can hear what''s in that carrier.$B$BIt was just a harmless prank.$B$BDon''t do it, please!$B$BStop!$B$BDon''t open that carrier!' WHERE `ID` = 35141;
UPDATE `quest_offer_reward` SET `RewardText` = 'Kash''drakor is coming here?! Ha! I once saw him cut through a dozen Laughing Skulls because they had his son.$b$bHe is the purist expression of destruction.' WHERE `ID` = 35152;
UPDATE `quest_offer_reward` SET `RewardText` = 'Those goren tunnels have proven useful.' WHERE `ID` = 35210;
UPDATE `quest_offer_reward` SET `RewardText` = 'I like killing things. And bones.' WHERE `ID` = 35248;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am glad to see that you have arrived safely.$B$BCome, there is much work to be done here.
' WHERE `ID` = 35332;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah. I see you have found a creation of Draenor alchemy.
' WHERE `ID` = 35342;
UPDATE `quest_offer_reward` SET `RewardText` = 'Please. Help me. I need to find my father.
' WHERE `ID` = 35343;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, stranger. I don''t think the razorfangs were happy that I was hunting the same prey.
' WHERE `ID` = 35344;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did this for my family? After you saved our father? Thank you, $n.$B$BYou wished to know about Draenor alchemy? I will do my best to share my knowledge with you.
' WHERE `ID` = 35345;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s MY arrow! Where''d you get it?' WHERE `ID` = 35356;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n. You succeeded where I did not.$B$BPerhaps you outsiders aren''t such bad hunters after all.' WHERE `ID` = 35357;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, Commander. Many of the orcs have tried to master the power of the genesaur but I have never heard of any succeeding.$B$BYou have won us a powerful weapon for the next time we face the Iron Horde.
' WHERE `ID` = 35416;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming to our aid.' WHERE `ID` = 35444;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hey, you''re from that Horde base right?$B$BGlad you made the trip because we really could use your help!
' WHERE `ID` = 35620;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, friend. I am in your debt.$b$bThis arrogant Iron Horde has made a dangerous enemy today.' WHERE `ID` = 35665;
UPDATE `quest_offer_reward` SET `RewardText` = 'These creatures are relentless in their assault against one another.' WHERE `ID` = 35686;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have a true talent for combat.' WHERE `ID` = 35693;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes... Think of the orcs that will fall before us with this power...' WHERE `ID` = 35702;
UPDATE `quest_offer_reward` SET `RewardText` = 'Percy and I want to give you something as a token of our thanks. It''s not much but please, take your reward.' WHERE `ID` = 35704;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re armed to the teeth! Say, would you be interested in helping a weary gnome out?
' WHERE `ID` = 35713;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re a lifesaver! Let''s get these to the excavation site.
' WHERE `ID` = 35716;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. Her wounds have closed.' WHERE `ID` = 35730;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s... quite a bit of charcoal. Nicely done!
' WHERE `ID` = 35739;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re kidding! What a world.
' WHERE `ID` = 35782;
UPDATE `quest_offer_reward` SET `RewardText` = 'One minute you are skirting the cauldrons avoiding the Gronn, the next a blast a steam followed by burning hot claws. Erosian''s death should make our scouts lives a lot easier!
' WHERE `ID` = 35807;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have defeated yet another deadly beast in Gorgrond.$B$BDessicus cared little on who he preyed upon, they all went into his salt pools forever. You have saved many lives $n!
' WHERE `ID` = 35810;
UPDATE `quest_offer_reward` SET `RewardText` = 'I thought I felt less quakes in the earth. His fury caused untold damage to this world, it is good that he has fallen to you.
' WHERE `ID` = 35811;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our purpose here was hard enough without a giant beast like Charl harassing our scouts and aggravating the Gronn.$B$BGlory to you $n!
' WHERE `ID` = 35815;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah perfect. I''ll get this up an'' runnin'' in no time.' WHERE `ID` = 35828;
UPDATE `quest_offer_reward` SET `RewardText` = 'Alright, let''s put this thing to use!
' WHERE `ID` = 35835;
UPDATE `quest_offer_reward` SET `RewardText` = 'These savages have no honor, it is time we deal with the Iron Horde presence on this island.
' WHERE `ID` = 35876;
UPDATE `quest_offer_reward` SET `RewardText` = 'I can see the future of my enemies in the bones. They''re gonna die!' WHERE `ID` = 35880;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hey there, bub. Lucy sent you? Good kid.$B$BYeah... you look like you''ll do nicely.
' WHERE `ID` = 35922;
UPDATE `quest_offer_reward` SET `RewardText` = 'What is it you found? Let me see that.
' WHERE `ID` = 35924;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is grim news, $n.' WHERE `ID` = 35925;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. Nisha is nearly returned to health.' WHERE `ID` = 35934;
UPDATE `quest_offer_reward` SET `RewardText` = 'Of course you haven''t! I mean, look at these things...you can''t sneak into anything with these things clacking around.
' WHERE `ID` = 35939;
UPDATE `quest_offer_reward` SET `RewardText` = 'We are impressed with your ability to slay the goren. They are relentless and voracious and can overwhelm those are not prepared.
' WHERE `ID` = 35944;
UPDATE `quest_offer_reward` SET `RewardText` = 'We are impressed with your ability to slay the goren. They are relentless and voracious and can overwhelm those are not prepared.' WHERE `ID` = 35948;
UPDATE `quest_offer_reward` SET `RewardText` = 'Nice! What did you get?$B$BA necklace, not bad.. another necklace, good. A giant rock in the shape of an ogre head?$B$B<Greblin seems puzzled, he glances up at you.>$B$BSeriously? This is a rock in the shape of an idiot. Whatever, the necklaces look good.$B$BNot a bad find overall.
' WHERE `ID` = 35970;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, that''s way better.$B$BMaybe next time they''ll think twice before they throw a rock at someone. Err... I mean if they weren''t so dead and everything.
' WHERE `ID` = 35972;
UPDATE `quest_offer_reward` SET `RewardText` = 'You got the ring? Nice! The Steamwheedle Preservation Society is going to make some serious moolah on this stuff.$B$BNixxie will be pleased.
' WHERE `ID` = 35973;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh very good. I''ve been waiting to get a close look at one of these - let''s open it up here.$B$BHmmmmm...$B$BWell, those goblins aren''t very creative but their methods have a certain brute-force charm to them. It''s amazing this thing doesn''t explode. Or maybe it does. At least I''m beginning to understand what they use a "samophlange" for.$B$BThis will work. Well done, $n!
' WHERE `ID` = 35991;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh - it''s still alive! Can you feel that?$B$BI must return this to the soil of Draenor when we are done with it. Perhaps in the care of the Cenarion Circle, who can ensure that it doesn''t grow into another corrupted threat.$B$BWell done, $n. This was no easy feat.
' WHERE `ID` = 35992;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve done a great thing today, $n. We''ve deprived Gul''dan of one of his top lieutenants and we''re one step closer to finding the fiend himself.
' WHERE `ID` = 35993;
UPDATE `quest_offer_reward` SET `RewardText` = 'The felbreaker''s tome is blank? Let me see that. Did you get the Sorcerer King''s sigil? Of course - see here, as you run the sigil over the page, runic lettering appears. Oh... this is really advanced.$B$BIt may take some time to fully comprehend what you''ve discovered, $n, but these initial pages appear to be dedicated to the nature of fel. Exactly what I need! Great work!
' WHERE `ID` = 35997;
UPDATE `quest_offer_reward` SET `RewardText` = 'How are you feeling? Can I get you a drink?$B$BI wish I could say that things will get easier from here, but we''re just getting started. I must ask you to storm the very heart of the ogre empire... Are you ready?
' WHERE `ID` = 36004;
UPDATE `quest_offer_reward` SET `RewardText` = 'Stabbed! He''s been stabbed!$B$BWhy wasn''t he more careful? We could''ve set up wards, we could''ve -$B$BIt doesn''t matter now. We have to act fast.
' WHERE `ID` = 36005;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Kirin-Tor responded quickly. Jaina was here in minutes. But if you hadn''t located Garona, the Archmage would''ve died for certain. Thank you, $n!
' WHERE `ID` = 36006;
UPDATE `quest_offer_reward` SET `RewardText` = 'How are you feeling?$B$BThat ring of yours is now one of the most powerful artifacts on this world. Which is good. Because we''re about to strike right at the heart of the enemy...
' WHERE `ID` = 36007;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me see what we have here... very interesting! This runic language here seems similar to the ignan kalimag dialect spoken by Azeroth''s fire elementals. A full translation may take years.$B$BBut these parts written in orcish - yes, these I can probably decipher. Not just to bend steel, but to bend elemental power itself to our will.$B$BGul''dan may be powerful, but if we continue to unlock the mysteries of Draenor, we will be able to counter his every move...
' WHERE `ID` = 36010;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found it! I have heard stories of these orbs of power. How I craved to study them during my long exile in Outland. And now, at last, I have one. Show me...$B$B<Reverently, Khadgar opens your pack and looks inside. His face remains motionless for a long time. Finally, he speaks:>$B$B...I don''t know what I expected.
' WHERE `ID` = 36012;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve got the tablets. Good, good! It must''ve been very time-consuming to assemble these - not to mention dangerous. I am lucky to have you.$B$BI see no reason to delay. Show me your ring. Yes... I can do this. Let''s put these tablets to use and enhance your power.
' WHERE `ID` = 36013;
UPDATE `quest_offer_reward` SET `RewardText` = 'What do we have here? The legends ARE true. Blackhand sacrificed his own arm to the elements. Now that he''s dead, it''s indistinguishable from stone. Or is it?$B$B<Khadgar utters a few incantations from the Flamebinder''s Tome. The severed hand slowly clenches into a fist.>$B$BHmmmm. Yes. $n, I''ll be perfectly honest with you: This thing is extremely creepy.
' WHERE `ID` = 36014;
UPDATE `quest_offer_reward` SET `RewardText` = 'Gul''dan''s magic is embedded deep within Garona''s mind. The more time I spend with her, the more it becomes clear that we MUST free her from his control.$B$BI am not giving up on this, $n.
' WHERE `ID` = 36017;
UPDATE `quest_offer_reward` SET `RewardText` = 'My studies have gone well. I believe we are ready for the next step. You may not like it...
' WHERE `ID` = 36018;
UPDATE `quest_offer_reward` SET `RewardText` = 'GOOD WORK, BRING ME BACK MORE AND I''LL COOK YOU UP A CUP OF MY FAMOUS HUMAN BONE BROTH! HAHAH!
' WHERE `ID` = 36042;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I have a ride back to your outpost ready.
' WHERE `ID` = 36047;
UPDATE `quest_offer_reward` SET `RewardText` = 'A simple exchange with complex results. That''s the art of doing business.
' WHERE `ID` = 36054;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is hard to admit that there is a creature more brutal than an ogre, but the ogron definitely fit that description. Facing a captured ogron in the arena is no mean feat. Facing one in their own lair is something even more dangerous. Hail to thee champion!
' WHERE `ID` = 36075;
UPDATE `quest_offer_reward` SET `RewardText` = 'We are impressed with your ability to slay the goren. They are relentless and voracious and can overwhelm those are not prepared.
' WHERE `ID` = 36076;
UPDATE `quest_offer_reward` SET `RewardText` = 'A gronn''s eye is not something they part with alive. Your gladiator described a fight hard won and this trophy is a testament to your abilities.  Well done!' WHERE `ID` = 36081;
UPDATE `quest_offer_reward` SET `RewardText` = 'The botani are nothing to be trifled with. They are incredibly cunning and their powers are strong on their home land. Taking one of their blooms is an true example of your fighting skill!
' WHERE `ID` = 36084;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work!$B$BNow, it is time for the next phase of our plan.' WHERE `ID` = 36085;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re looking for what now? I mean, yeah sure... whatever. Just get me down alright?
' WHERE `ID` = 36117;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work. If you happen to find anymore Artifact Fragments, bring them to me or the others in need of them to contribute to the war effort.
' WHERE `ID` = 36133;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re going to make a fine overseer, sir! Keep those peons in line!$B$BNow you know the basics of logging and finding timber. Time to put them to good use for the good of your garrison.
' WHERE `ID` = 36137;
UPDATE `quest_offer_reward` SET `RewardText` = 'Marvelous, marvelous! I will use these to upgrade your ring once we finish up a couple more tasks...
' WHERE `ID` = 36158;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re going to make a fine overseer, $g sir:ma''am;! Keep those lumberjacks in line!$B$BNow you know the basics of logging and finding timber. Time to put them to good use for the good of your garrison.' WHERE `ID` = 36189;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s how it''s done, commander!$B$BWe''re now fully operational. Any time you have enough timber to place a work order, come on back to me and we''ll get started.$B$BThis garrison ain''t gonna build itself!' WHERE `ID` = 36192;
UPDATE `quest_offer_reward` SET `RewardText` = 'We haven''t even scratched the surface when it comes to overkill.$B$BIt looks like this group will serve you well, $g sir:ma''am;. Medium sized trees across Draenor are now at your mercy. That means more timber per tree!' WHERE `ID` = 36194;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve just now showed up? Well, better late than never.
' WHERE `ID` = 36196;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work. If you happen to find anymore Artifact Fragments, bring them to me or the others in need of them to contribute to the war effort.
' WHERE `ID` = 36198;
UPDATE `quest_offer_reward` SET `RewardText` = 'That solves one riddle. The moment they arrived in Draenor, Garrosh killed his savior.$B$BHe left the job unfinished; The dragon''s spirit is still restless.$B$BI hope you''re ready for a fight.
' WHERE `ID` = 36206;
UPDATE `quest_offer_reward` SET `RewardText` = 'Goren crystals are used by some as weapons. The acid left behind can be deadly though, even to the wielder.' WHERE `ID` = 36208;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your search brought rewards?' WHERE `ID` = 36209;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, yes, these shells will work perfectly.' WHERE `ID` = 36210;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have the notes. Let us see what they reveal about our enemy''s strategy.' WHERE `ID` = 36223;
UPDATE `quest_offer_reward` SET `RewardText` = 'It seems that you have found a very special tailoring book.$b$bIt belongs to Ameeka, a tailor of great renown from Embaari Village.' WHERE `ID` = 36236;
UPDATE `quest_offer_reward` SET `RewardText` = 'Is that my tailoring tome? It is! I''m so glad it is safe! How can I ever repay you?' WHERE `ID` = 36262;
UPDATE `quest_offer_reward` SET `RewardText` = 'Again, you show me great kindness.$b$bNow, let us begin.' WHERE `ID` = 36266;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is perfect! The cloth and magic are perfectly balanced and stable.

I am happy to say that you have learned the basics of my tailoring methods. I respect your skill and your eagerness to learn new techniques.

Let me give you some other patterns and materials that I hope you find useful during your journey.' WHERE `ID` = 36269;
UPDATE `quest_offer_reward` SET `RewardText` = 'I won''t waste your time, champ. I''ve got a once in a lifetime opportunity for you.
' WHERE `ID` = 36280;
UPDATE `quest_offer_reward` SET `RewardText` = 'I won''t waste your time, champ. I''ve got a once in a lifetime opportunity for you.
' WHERE `ID` = 36282;
UPDATE `quest_offer_reward` SET `RewardText` = 'Interesting, an Arakkoa recently visited the garrison looking for an armor piece with a powerful enchantment like this. His name was Delath.

The enchantment on this bracer is beyond my skill, but perhaps this Delath can give you the necessary insight to replicate it.' WHERE `ID` = 36308;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do I also detect that you have in your possession an artifact of our land? 

Can I see it?

One of Oru''kai''s bracers... Thank you!' WHERE `ID` = 36310;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. I thought I was going to be stuck here forever.' WHERE `ID` = 36313;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes... This is it, after so many years. Soon, I will have all of the Armaments of Oru''kai.

Return my ring as well and I will fulfill the promise I made to that squeamish draenei. 

Take this book. If you have any skill, you can use it to decipher and learn Draenor''s enchantments. 

Of course, you will need a proper workplace as well. Here are plans; hopefully you can follow them.

Now, be gone, and steer clear of the other armaments, for they are mine.' WHERE `ID` = 36315;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, so the trap held! I can smell the meat already. This will make a great feast for our warriors!
' WHERE `ID` = 36344;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very good. We will have your leather or fur ready soon.$B$BNow that you know how to use the trap, it will be available for your use at any time. We can only handle so many beasts in the barn at one time, though. I would not advise taking more from the land than necessary.
' WHERE `ID` = 36345;
UPDATE `quest_offer_reward` SET `RewardText` = '"The brothers united once more," he said.$B$B"A world full of untold riches to plunder," he said.$B$B"Wealth beyond imaging," he said!$B$BAnd then he proceeded to drop a log on top of me.$B$B"There can only be one CEO of Barov Industries," he said.$B$BAt least we can agree on that...' WHERE `ID` = 36429;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, $n.' WHERE `ID` = 36495;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve seen plant life mimic the vicious hydra before, but to improve on the design? Only in Gorgrond... excellent work $n.
' WHERE `ID` = 36502;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a fine cloak! Sadly, we no longer have the resources to make them like this.
' WHERE `ID` = 36505;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for vouching for me, commander.' WHERE `ID` = 36508;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are covered in soot from head to toe, $n!$B$BAs promised, I will help you repair your cloak. I have a few other items here which you might find useful as well.$B$BCome back and see me any time!
' WHERE `ID` = 36516;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have dealt a great blow to the Iron Horde, commander. We will defeat them yet.
' WHERE `ID` = 36576;
UPDATE `quest_offer_reward` SET `RewardText` = 'Commander. Good to have you back.

We''ve got some movement in Nagrand. The board can fill you in on the details.' WHERE `ID` = 36601;
UPDATE `quest_offer_reward` SET `RewardText` = 'You came from Draenor? How does that even work?!
' WHERE `ID` = 36608;
UPDATE `quest_offer_reward` SET `RewardText` = 'You truly are a master fisherman!$B$BI would be delighted to join you here on Draenor and help you catch as many lunkers as you can. But first, let''s grab a drink.
' WHERE `ID` = 36616;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me unpack that for you.$B$BI should let you know - while we managed to expedite this one, future work orders will take longer.
' WHERE `ID` = 36641;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me unpack that for you.$b$bI should let you know - while we managed to expedite this one, future work orders will take longer.' WHERE `ID` = 36643;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me unpack that for you.$b$bI should let you know - while we managed to expedite this one, future work orders will take longer.' WHERE `ID` = 36645;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me unpack that for you.$B$BI should let you know - while we managed to expedite this one, future work orders will take longer.
' WHERE `ID` = 36646;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me unpack that for you.$B$BI should let you know - while we managed to expedite this one, future work orders will take longer.
' WHERE `ID` = 36647;
UPDATE `quest_offer_reward` SET `RewardText` = 'Word of the assault has already made it back, as have some spoils from the fight.$B$BWell done sir, if you don''t mind me saying.
' WHERE `ID` = 36649;
UPDATE `quest_offer_reward` SET `RewardText` = 'News about da assault beat ya back, boss-mon. And some spoils of the fightin''.$B$BYa be a force to be reckonin'' with.
' WHERE `ID` = 36667;
UPDATE `quest_offer_reward` SET `RewardText` = 'Word of the assault has already made it back, as have some spoils from the fight.$B$BWell done sir, if you don''t mind me saying.
' WHERE `ID` = 36682;
UPDATE `quest_offer_reward` SET `RewardText` = 'Word of the assault has already made it back, as have some spoils from the fight.$B$BWell done sir, if you don''t mind me saying.
' WHERE `ID` = 36685;
UPDATE `quest_offer_reward` SET `RewardText` = 'Word of the assault has already made it back, as have some spoils from the fight.$B$BWell done sir, if you don''t mind me saying.
' WHERE `ID` = 36686;
UPDATE `quest_offer_reward` SET `RewardText` = 'News about da fightin'' beat ya back, boss-mon. And some spoils too.$B$BDem Alliance must a been none too happy to see ya on the field.
' WHERE `ID` = 36698;
UPDATE `quest_offer_reward` SET `RewardText` = 'News about da assault beat ya back, boss-mon. And some spoils of the fightin''.$B$BYa be a force to be reckonin'' with.
' WHERE `ID` = 36699;
UPDATE `quest_offer_reward` SET `RewardText` = 'News about da assault beat ya back, boss-mon. And some spoils of the fightin''.$B$BYa be a force to be reckonin'' with.
' WHERE `ID` = 36701;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ya brought my gear! Well it be lookin'' like my luck might be turnin'' around after all!$B$BAbu''gar will be returnin'' the favor, just ya wait and see!$B$BRight after I hook myself a lunker, of course...
' WHERE `ID` = 36711;
UPDATE `quest_offer_reward` SET `RewardText` = 'The lives of all the flock are precious.
I''m glad to know that his murderers have been brought to justice.

Thank you, $n, you have done us a great honor.' WHERE `ID` = 36790;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will take any lunkers you like find like this off your hands. Come back and see me anytime you catch one and I will pay you top dollar!
' WHERE `ID` = 36800;
UPDATE `quest_offer_reward` SET `RewardText` = 'Waugh! We beat back the demons, Commander. My blood''s still boiling from it. My eyes aren''t turning red, are they?
' WHERE `ID` = 36831;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have impressed me greatly, $n. If you will have me, I would like to join you at your garrison.
' WHERE `ID` = 36833;
UPDATE `quest_offer_reward` SET `RewardText` = 'OOH IT''S SO RUBBERY. AND STILL WARM. GOOD WORK!<table class="iconlist"><tr><th align="right" id="iconlist-icon1"></th><td><span class="q3"><a href="/item=112119">Worgen Snout</a></span></td></tr></table><script type="text/javascript">//<![CDATA[WH.ge(''iconlist-icon1'').appendChild(g_items.createIcon(112119, 0, 1, null, null));//]]></script>
' WHERE `ID` = 36884;
UPDATE `quest_offer_reward` SET `RewardText` = 'A friend it would seem.

Kayn did not think we could handle this? He might have been right this time.' WHERE `ID` = 36920;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your will be done. I require your advisement, commander.
' WHERE `ID` = 36953;
UPDATE `quest_offer_reward` SET `RewardText` = 'Pretty cool invention you have there.
' WHERE `ID` = 37044;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s all? Well. don''t feel too bad. Some days we find nothing and the next we hit the jackpot!$B$BHere, I have a fresh supply of items from our latest outing. Check them out.$B$BGood luck!
' WHERE `ID` = 37045;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m glad ya be findin'' a good hire!$B$BMake sure to check back every week and I''ll bring ya me latest recruits.
' WHERE `ID` = 37046;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have shown far too much mercy to your enemies, commander.$B$BIf you would allow me, I have a spell I''ve been perfecting that will show them what happens when you stand in our way.
' WHERE `ID` = 37081;
UPDATE `quest_offer_reward` SET `RewardText` = 'Rest and relaxation for the tired and cold -- that''s our motto! Please, take a seat by the fire and rest your weary bones.$B$BWould you like to try a sampling of some of our fine food and drink?' WHERE `ID` = 37112;
UPDATE `quest_offer_reward` SET `RewardText` = 'My purpose as a Talonpriest has been fulfilled, though Iskar and Zellek must think me a fool for altering the sacred rites.$B$BI care not for their approval, and I am done hiding in the shadows.$B$BLet me fight for you. I should like to improve this world before I fade away from it.' WHERE `ID` = 37141;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good thinkin''. Winky always loved these flameflies. If we gather enough of them, maybe we can convince hiim to come back!$B$BMaybe, er, you should hold onto this for a while, eh?
' WHERE `ID` = 37148;
UPDATE `quest_offer_reward` SET `RewardText` = 'Perfect, here''s a prize for your efforts.$B$BI''ve got to head out and save everyone now. Again.
' WHERE `ID` = 37149;
UPDATE `quest_offer_reward` SET `RewardText` = 'Revenge has the sweetest taste. Like an apple.$B$BTake this, friend. May all of your fruit be CRUSHED INTO PULP LIKE YOUR ENEMIES.
' WHERE `ID` = 37152;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oi, it''s a fair sight dirtier, but that''s her! Here, this is for you. You have my thanks.
' WHERE `ID` = 37153;
UPDATE `quest_offer_reward` SET `RewardText` = 'This... may help me. I will need to return to Light''s Hope shortly, you have my thanks.$B$BI will not need these supplies any longer, they are yours.
' WHERE `ID` = 37154;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent, most excellent.$B$BI will wear it down quickly, and it cannot be repaired due to its unique nature. Expect to hear from me again.
' WHERE `ID` = 37156;
UPDATE `quest_offer_reward` SET `RewardText` = 'One is eternally in your debt for what is, one is certain, an entirely selfless act on the part of the commander.$B$BThough more barrels were likely available, one will staunchly make do with the single barrel provided, comforted in the knowledge that the commander must deal with the great pressing issues of this land, and does not have time to clean up the mud that that so dutifully follows the commander''s heroic allies.
' WHERE `ID` = 37157;
UPDATE `quest_offer_reward` SET `RewardText` = 'The sun, I can see it. It is so bright.$B$BI... wish to be alone. Take this, and my thanks.
' WHERE `ID` = 37158;
UPDATE `quest_offer_reward` SET `RewardText` = 'My thanks, $n. Aviana will be pleased, and we may yet be able to aid you.$B$BAviana has sought fit to bless you with this, use it well.
' WHERE `ID` = 37159;
UPDATE `quest_offer_reward` SET `RewardText` = 'I like this blade. It will see me through much removing of limbs. Here, for you, something to remember me by.
' WHERE `ID` = 37160;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found it! It''s safe! I was so worried! Take this, take it!
' WHERE `ID` = 37161;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is dire evidence indeed! I shall head there presently, to slay no less than twenty of the great beasts.$B$BFor Doloria!
' WHERE `ID` = 37162;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is... it can''t be.$B$BI must be off, here is your reward. I do not part with it lightly...
' WHERE `ID` = 37164;
UPDATE `quest_offer_reward` SET `RewardText` = 'Dis... is no good. Dey want to consume da whole planet. How did dey get so angry? What happened to dem? I''m gonna bring dis back to da Circle, we probably gonna need your help again soon.$B$BOne of dem fronds be a bit magical, you hold onto it for a bit.
' WHERE `ID` = 37165;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is precisely what I was hoping for! I shall begin to study it immediately.$B$BWhile you were away, I collected these pretty flowers for you!
' WHERE `ID` = 37166;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming.
' WHERE `ID` = 37177;
UPDATE `quest_offer_reward` SET `RewardText` = 'You know, you''re quite handy, and awfully powerful. Why don''t I just follow you for a while?$B$BLook out Draenor, DOOOOOOOOM is coming!
' WHERE `ID` = 37179;
UPDATE `quest_offer_reward` SET `RewardText` = 'I won''t waste any of your time, sir. Let us discuss strategy.
' WHERE `ID` = 37183;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wow! I knew Begruu''s horn would be big, but I never imagined it would be this massive!$B$BWe''re going to have to charge the buyer extra for delivery!
' WHERE `ID` = 37211;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m not going to lie to you, $n... I''ll be sleeping more soundly at night knowing that Direhoof isn''t out there somewhere roaming the wild.$B$BI''ll also be sleeping more soundly on the pile of money I''m going to make selling this hide to some rich collector!$B$BCha-ching!
' WHERE `ID` = 37222;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wow! Look at the size of that thing... that''s got to be the biggest hippo I''ve ever seen!$B$BMu''gra was one of the angriest hippos I''ve ever seen, but she''s all smiles now!$B$BGet it? Hippo teeth... smiles... eh, eh?
' WHERE `ID` = 37224;
UPDATE `quest_offer_reward` SET `RewardText` = 'What''s that you got there?$B$B<Gazmolf examines the talon>$B$BHey! That definitely looks like it belonged to Thek''talon, and even if it''s not who''s to say otherwise? Great work, here''s your cut!
' WHERE `ID` = 37225;
UPDATE `quest_offer_reward` SET `RewardText` = 'Whoa! Careful where you point that stinger!$B$B<Gazmolf examines Xelganak''s stinger>$B$BExtraordinary... I''ve never seen anything like this before. As an archaeologist of the highest caliber, it is an honor to artificially fossilize this item and sell it to the highest bidder.$B$BWell done!
' WHERE `ID` = 37226;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our bones are all we have left of an existence we left behind a long time ago.$b$b<The prince stares intently into your eyes.>$b$bStay with me, $c. I will help you find your Tidestone.' WHERE `ID` = 37257;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Shattered Hand and their allies are dangerous, commander. No offense, but I don''t trust your standing forces to keep a future assassin from slipping in unnoticed.$B$BI would like to volunteer myself to join your forces so I can keep a close watch on enemy movements. We cannot risk your untimely death - too much rests on your shoulders.
' WHERE `ID` = 37276;
UPDATE `quest_offer_reward` SET `RewardText` = 'You be makin'' the right call, commander. There be no room for her kind in your ranks.
' WHERE `ID` = 37292;
UPDATE `quest_offer_reward` SET `RewardText` = 'The shrine has dozens of niches where the Prophet''s followers have placed their own memory crystals, mourning the great leader''s sacrifice. You slide the crystal into an empty socket and the memorial comes to life...' WHERE `ID` = 37322;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, so you are the one your people spoke of so highly. We may discuss an alliance, but first...' WHERE `ID` = 37326;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. We have more immediate concerns to deal with until he visits.$B$BDark Ranger Velonara requires your immediate attention, $Gsir:maam;.' WHERE `ID` = 37328;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh - you were attacked by an Umbraspore Giant? They''re very dangerous - you were brave to face one down!$B$BThis growth you found doesn''t seem to be part of the giant. It''s almost like another organism living in symbiosis. We''ll have to study this more closely and see what benefit it conveys to the host.$B$BThank you, $n. Outstanding work!
' WHERE `ID` = 37332;
UPDATE `quest_offer_reward` SET `RewardText` = 'Congratulations, commander. You have survived Rotun''s trial and proven yourself powerful indeed. $B$BHere, take this weapon, that you may further dominate your foes in battle!
' WHERE `ID` = 37433;
UPDATE `quest_offer_reward` SET `RewardText` = 'If this is not enough demon blood, no amount will be. Now, let us see if we can make contact with Illidan''s spirit in the Twisting Nether.
' WHERE `ID` = 37447;
UPDATE `quest_offer_reward` SET `RewardText` = 'Then, it''s decided. We either expose Detheroc or it''s war between the Alliance and Horde, and we lose the world to the Burning Legion.
' WHERE `ID` = 37448;
UPDATE `quest_offer_reward` SET `RewardText` = 'Grim news indeed. We cannot afford the loss of even one demon hunter, but you and Kor''vas were right to put an end to Nightglaive.

More importantly, you have made a good friend in Stellagosa. The remnant of the Blue Dragonflight could prove to be a powerful ally.' WHERE `ID` = 37449;
UPDATE `quest_offer_reward` SET `RewardText` = 'Beautiful creatures... pure, one with the world. I didn''t think that I could hate the Legion more.

Thank you, $n.' WHERE `ID` = 37450;
UPDATE `quest_offer_reward` SET `RewardText` = 'A simple exchange with complex results. That''s the art of doing business.
' WHERE `ID` = 37454;
UPDATE `quest_offer_reward` SET `RewardText` = 'A bloody price to pay just to play with luck. Let''s hope it was worth it.
' WHERE `ID` = 37458;
UPDATE `quest_offer_reward` SET `RewardText` = 'A bloody price to pay just to play with luck. Let''s hope it was worth it.
' WHERE `ID` = 37459;
UPDATE `quest_offer_reward` SET `RewardText` = 'You killed Athissa, $n.$b$bThat is to say, you and... and my people...$b$bMy people... they fought for us...$b$bBut, Warlord Parjesh has escaped through the portal with the Tidestone. You must pursue him and retrieve the Pillar of Creation.' WHERE `ID` = 37470;
UPDATE `quest_offer_reward` SET `RewardText` = 'She spoke of the Tidestone? That sea witch must not realize how close she truly is to finding it.$b$bWe should move quickly. We are close to your prize, and the naga are circling in.' WHERE `ID` = 37486;
UPDATE `quest_offer_reward` SET `RewardText` = 'I can''t tell you how relieved I am that Elder Aldryth has returned.$b$bHonestly, life here in the palace hasn''t been the same without him. Everything seemed to have... lost its color. Perhaps now we can get back to our normal lives.' WHERE `ID` = 37492;
UPDATE `quest_offer_reward` SET `RewardText` = 'We made it. Now all we have to do is get up there, sneak through my city -- which, mind you, is being watched by everyone -- then reveal and kill a dreadlord inside the headquarters of SI:7, Azeroth''s most elite spy organization.$B$BPiece of cake. Ready to save the world, $n?
' WHERE `ID` = 37494;
UPDATE `quest_offer_reward` SET `RewardText` = 'Did you get my bottle? Are you here to help us escape?' WHERE `ID` = 37496;
UPDATE `quest_offer_reward` SET `RewardText` = 'That could have gone better. Sounds like you''ve already made an enemy.

Still, that''ll work to our advantage. You versus Boss Whalebelly. The fight of the century... or at least, the day.

Now to set everything up.' WHERE `ID` = 37507;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hello, what can I do for you, little $r?

Ahahaha... it''s you!  I like how you came in and immediately confronted Whalebelly. That little tuskarr''s got it coming.

I can tell you''re going to win big for me in the arena.' WHERE `ID` = 37510;
UPDATE `quest_offer_reward` SET `RewardText` = 'Shh... keep it down. The last thing I want is to get punched in the face by an ogre.
' WHERE `ID` = 37511;
UPDATE `quest_offer_reward` SET `RewardText` = 'It sounds like the excavation of Broken Precipice is going to be fully operational in no time.$B$BI can''t wait to line my pockets with some of that sweet moolah.
' WHERE `ID` = 37516;
UPDATE `quest_offer_reward` SET `RewardText` = 'Nice work, $n!$B$BIt''s times like these that make me proud to be your mentor. You''ll make a fine archaeologist someday!$B$BHere''s your cut!
' WHERE `ID` = 37520;
UPDATE `quest_offer_reward` SET `RewardText` = 'I couldn''t have snuck passed him better. Now, to get these weapons into the right hands.' WHERE `ID` = 37528;
UPDATE `quest_offer_reward` SET `RewardText` = 'What happened, Farondis?' WHERE `ID` = 37530;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now the captives are free. Thank you, $n.

Ready for the prince?' WHERE `ID` = 37565;
UPDATE `quest_offer_reward` SET `RewardText` = 'With Oceanus dead, the skrogs will start fighting amongst themselves. They''ll certainly be too busy to provide any further assistance to the naga.

I''d say this was a job well done, despite my being captured. Good thing you came along.

I''ll see you around, $n.' WHERE `ID` = 37566;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me unpack that for you.$B$BI should let you know - while we managed to expedite this one, future work orders will take longer.
' WHERE `ID` = 37569;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me unpack that for you.$B$BI should let you know - while we managed to expedite this one, future work orders will take longer.
' WHERE `ID` = 37574;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes. Already, I can tell their souls are weaker than their flesh.' WHERE `ID` = 37653;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do you know what ship this is? It''s the Queen''s Reprisal. Queen... as in the Banshee Queen, Sylvanas Windrunner.

If the farmstead weren''t sunk under the waves, I''d be heading home to Gilneas right about now.' WHERE `ID` = 37654;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve always had my doubts about Cyana. Something was never quite right there. Looks like she cracked and joined the Legion.

Still, we are not going to let her, or this Cordana Felsong, get away with it.' WHERE `ID` = 37656;
UPDATE `quest_offer_reward` SET `RewardText` = 'What? A jailer demon you say? Oublion? What a ghastly name.

No wonder we couldn''t become trade partners with them. Oh, if only I''d known, there wouldn''t have been any need for such slaughter!

Ah well. Live and learn.' WHERE `ID` = 37657;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. That will give us the breathing room we need to launch our counter-offensive.' WHERE `ID` = 37658;
UPDATE `quest_offer_reward` SET `RewardText` = 'I wouldn''t take what Arev''naal said to heart. The inquisitor demons are masters of misinformation. You don''t suspect betrayal within the ranks, do you?

<The Souleater looks thoughtful and grim.>

I fear we won''t have all of our answers about Lord Illidan for a while.' WHERE `ID` = 37660;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have my eternal gratitude, $n. Let it never be said that I have underestimated the reach and prowess of the Uncrowned.$B$BThe easy part''s done. Now it''s time to do the impossible.
' WHERE `ID` = 37666;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t worry about the scattered pages and spines - I will have my aides clean up.$b$bThank you. You may return to your studies.' WHERE `ID` = 37678;
UPDATE `quest_offer_reward` SET `RewardText` = 'So the Shadow Council is involved? Interesting...
' WHERE `ID` = 37687;
UPDATE `quest_offer_reward` SET `RewardText` = 'So the Shadow Council is involved? Interesting...
' WHERE `ID` = 37688;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did it! Mathias Shaw is back in charge of SI:7 and you prevented an all-out war between the Alliance and Horde.$B$BThe rest of us agree, you''ve proven yourself an invaluable member of the Council of Shadows and the Uncrowned.$B$BCongratulations, Shadowblade $n!
' WHERE `ID` = 37689;
UPDATE `quest_offer_reward` SET `RewardText` = 'Who goes there?$b$bAre you an emissary from that bizarre floating city?' WHERE `ID` = 37690;
UPDATE `quest_offer_reward` SET `RewardText` = 'Capital! A prodigious start.$B$BI implore you to create this marvelous mixture for yourself. I want to share the delight of alchemical spirits with the world!$B$BYou''ll need to get more eggs for yourself, though.' WHERE `ID` = 37727;
UPDATE `quest_offer_reward` SET `RewardText` = 'I was going to present this to one of the ladies of the court. Doing so might increase my standing in certain social circles.

But, I just can''t bring myself to do it. Who better to drink my latest masterpiece than, well... me?' WHERE `ID` = 37728;
UPDATE `quest_offer_reward` SET `RewardText` = 'Exemplary work, young $n. With runes like these, you''ll be graduating in no time.' WHERE `ID` = 37729;
UPDATE `quest_offer_reward` SET `RewardText` = 'She... she gave you her key? My word!' WHERE `ID` = 37730;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your hat and robes don''t match, but you still look better. I hardly recognize you.' WHERE `ID` = 37736;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very good, Commander! Brackenspore''s infestation will not be spreadin'' to da rest of Draenor.
' WHERE `ID` = 37756;
UPDATE `quest_offer_reward` SET `RewardText` = 'One of da most ruthless orcs to walk any land be defeated. You be havin'' my congratulations, and my thanks.
' WHERE `ID` = 37765;
UPDATE `quest_offer_reward` SET `RewardText` = 'Da Bloodmaul be finished, and with dem Imperator Mar''gok''s chances of acquirin'' da relic within da slag mines.$B$BDs be a good day, mon.
' WHERE `ID` = 37781;
UPDATE `quest_offer_reward` SET `RewardText` = 'You made it! This is just a practice race so your time doesn''t matter... other than bragging rights.$B$BTime to try the real race!
' WHERE `ID` = 37819;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n! I find it troubling that the Shadow Council is so entrenched in these hidden regions of Draenor. Gul''dan has kept himself busy.
' WHERE `ID` = 37835;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have earned this, $C. You''ve traveled the length and breadth of my world. You''ve surmounted unimaginable odds and stood toe-to-toe against ancient beasts, dark magics, and terrifying machines. Time and again you''ve inspired my people with your patience and bravery.$B$BThank you, $n.
' WHERE `ID` = 37839;
UPDATE `quest_offer_reward` SET `RewardText` = 'We meet again.$B$BNow that you have a shipyard, let''s talk about next steps...
' WHERE `ID` = 37841;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. Your efforts dull his pain.$b$b<She sighs.>' WHERE `ID` = 37853;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t you worry, small one. I am still back in Azurewing Repose, resting in my pool.$b$bIt doesn''t take much energy to throw a projection of myself here and there. I may be old and dying, but I AM still a blue dragon.' WHERE `ID` = 37855;
UPDATE `quest_offer_reward` SET `RewardText` = 'They''re tapping into the ley lines?' WHERE `ID` = 37857;
UPDATE `quest_offer_reward` SET `RewardText` = 'I owe you a great debt, $n.$b$bHelping a weakened old dragon like me is valorous enough. Saving my whelplings, and securing the future of our bloodline?$b$bI am now firmly committed to your cause.' WHERE `ID` = 37859;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, commander. Our scouts just returned with word of your success.$B$BWell done!
' WHERE `ID` = 37891;
UPDATE `quest_offer_reward` SET `RewardText` = 'The easy part is done, now comes the hard part.
' WHERE `ID` = 37935;
UPDATE `quest_offer_reward` SET `RewardText` = 'Word of your success has already been passed on by our scouts. $B$BLok''tar!
' WHERE `ID` = 37940;
UPDATE `quest_offer_reward` SET `RewardText` = 'I do feel a bit stronger.$b$bThose siphons nearly did me in, $n.' WHERE `ID` = 37960;
UPDATE `quest_offer_reward` SET `RewardText` = 'This place is absolutely crawling with guards. I don''t know how Garona can be so confident.$B$BAh well, let me brief you on the plan, such as it is...
' WHERE `ID` = 37964;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, commander. Our scouts just returned with word of your success.$B$BWell done!
' WHERE `ID` = 37968;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hail, $c. We could use your aid.' WHERE `ID` = 37991;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have quite a war on our hands. At least we do not lack for targets to strike!
' WHERE `ID` = 38001;
UPDATE `quest_offer_reward` SET `RewardText` = 'That will have to do for now.' WHERE `ID` = 38014;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for your cooperation.' WHERE `ID` = 38035;
UPDATE `quest_offer_reward` SET `RewardText` = 'Just in time! I was about to start bandaging wounds with leaves.' WHERE `ID` = 38036;
UPDATE `quest_offer_reward` SET `RewardText` = 'I already have reports of Bleeding Hollow hunters falling back to Zeth''Gol. This will give us a good edge in the battles to come.
' WHERE `ID` = 38044;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, commander! The Bleeding Hollow are sending their best warriors back to Zeth''Gol to defend it.$B$BThis should give us an advantage, albeit temporarily.
' WHERE `ID` = 38045;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t worry about the ship - it''s just wood and metal.$B$BThe Skyfire lives on as long as we keep fighting.' WHERE `ID` = 38052;
UPDATE `quest_offer_reward` SET `RewardText` = 'Alright... I''m reading full power on the transponder.$B$BNow for an antenna...' WHERE `ID` = 38058;
UPDATE `quest_offer_reward` SET `RewardText` = 'The distress signal got through. We''ll be evacuated to Greywatch immediately.$B$BI''m afraid that, for now, you will have to continue on your mission without us. Once we are settled, I will send out recon patrols to see if we can glean the location of the Aegis.$B$BYou must secure the Aegis of Aggramar if we are to drive back the Legion threat!' WHERE `ID` = 38060;
UPDATE `quest_offer_reward` SET `RewardText` = 'Here ya are, commander. We''ve got to let the forges cool for a while, but we should be ready to process more scraps tomorrow.
' WHERE `ID` = 38175;
UPDATE `quest_offer_reward` SET `RewardText` = 'Are you with us?' WHERE `ID` = 38206;
UPDATE `quest_offer_reward` SET `RewardText` = 'This tome looks like the one Iskar used to carry. What could have caused him to leave it?
' WHERE `ID` = 38213;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.$B$BThis was no easy task and I am grateful once again for your assistance. Iskar''s madness must be stopped.$B$BI trust that when the time comes you will be ready.
' WHERE `ID` = 38223;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mmmm. Olives. I love these things. They are the only reason worth to come to this filthy world.' WHERE `ID` = 38232;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great deal right? You got to kill a demon, your fancy weapon got more fancy, and I get to be the master now. Everybody wins!' WHERE `ID` = 38237;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s been a pleasure trading with you.
' WHERE `ID` = 38243;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, General. Our scouts just returned with word of your success.$B$BWell done!
' WHERE `ID` = 38252;
UPDATE `quest_offer_reward` SET `RewardText` = 'Roark is definitely in this prisoner train but it''s locked tight. We''ll have to - oh - you brought explosives? Naielle thinks of everything! Let''s crack this car open and see if we can convince that engineer to defect...' WHERE `ID` = 38254;
UPDATE `quest_offer_reward` SET `RewardText` = 'Lower your weapon, stranger. Blackhand is dead and our new "Warchief" just signed my death sentence. It looks like I''m going mercenary.$b$bYou want to build a shipyard? Then you want me.' WHERE `ID` = 38255;
UPDATE `quest_offer_reward` SET `RewardText` = 'Commander! I was told to expect you. The situation here is chaos.$b$bMy Rangari have had this place under surveillance since your original assault. It''s come back to life in recent weeks as the remnants of the Iron Horde flee to Tanaan under Gul''dan''s orders.$b$bMy scouts have learned something that might interest you...' WHERE `ID` = 38257;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found us a shipwright then? Good! Some of your followers are eager to take to the open seas.' WHERE `ID` = 38258;
UPDATE `quest_offer_reward` SET `RewardText` = 'You... remember me? I came through the portal with you. I was called... Ariok. Before I became this.
' WHERE `ID` = 38270;
UPDATE `quest_offer_reward` SET `RewardText` = 'You step on hallowed ground, invader. Here the chieftains of the Bleeding Hollow have performed rituals to see the future.$B$BYou should die but there is much at stake...
' WHERE `ID` = 38272;
UPDATE `quest_offer_reward` SET `RewardText` = 'Bah. Kilrogg not here. Only omens and warnings. That is your path $n, mine is to destroy Kilrogg...
' WHERE `ID` = 38274;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s been a pleasure trading with you.
' WHERE `ID` = 38287;
UPDATE `quest_offer_reward` SET `RewardText` = 'Finally, I can get back to the action!
' WHERE `ID` = 38317;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wonderful. The Archdruids have already assembled.' WHERE `ID` = 38322;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hah, you throw like a shieldmaiden!$B$BWhat? That''s a good thing! $B$BTry the stew, young champion, and savor the taste of a task well done.' WHERE `ID` = 38331;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wait... ye killed how many kvaldir? Yer braver than I thought, outsider!$B$BI''m sure Helya will see that neither ye nor I belong here once we get past that dog of hers.' WHERE `ID` = 38339;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was a truly revolting, outsider. Even in death I''ve never witnessed such a disgusting smell.' WHERE `ID` = 38347;
UPDATE `quest_offer_reward` SET `RewardText` = 'The R.A.S. is nothing if not humane.
' WHERE `ID` = 38357;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wonderful, just put that down anywhere. Careful not to spill it!$B$B<The apothecary snickers.>
' WHERE `ID` = 38358;
UPDATE `quest_offer_reward` SET `RewardText` = 'They have only begun to pay for their insolence.
' WHERE `ID` = 38361;
UPDATE `quest_offer_reward` SET `RewardText` = 'Look carefully at this head, $n. This is what comes to those who stand against the Forsaken.$B$BFor now, we should begin our search for the Aegis of Agrammar. I will send some scouts out to discern its location. You should start your search as well. $B$BWhat are you waiting for?
' WHERE `ID` = 38362;
UPDATE `quest_offer_reward` SET `RewardText` = 'I owe you my life, $n. We all do.' WHERE `ID` = 38376;
UPDATE `quest_offer_reward` SET `RewardText` = 'Cenarius is in need? Lord of the Forest, we shall not fail you...' WHERE `ID` = 38384;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope you find something you like!' WHERE `ID` = 38408;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am truly indebted to you for this act. My siblings were not able to defend themselves against the Felskorn, and would have ended up their slaves. $B$BYou are a true friend of the Thorignir.' WHERE `ID` = 38413;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am glad you came at once. Something terrible is brewing beneath this holy place.
' WHERE `ID` = 38421;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our forces can finish driving off the remaining lurkers. But there''s another problem up ahead.' WHERE `ID` = 38436;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, commander. Our scouts just returned with word of your success.$B$BWell done!
' WHERE `ID` = 38440;
UPDATE `quest_offer_reward` SET `RewardText` = 'Word of your success has already been passed on by our scouts. $B$BLok''tar!
' WHERE `ID` = 38441;
UPDATE `quest_offer_reward` SET `RewardText` = 'He is... he''s dying! Senegos is possibly the oldest dragon alive. We cannot simply let him slip away.

There is something not quite right with the magic energy here, I can feel it.' WHERE `ID` = 38443;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t worry, I have a taskforce coming in a bit to clean the rest up. We should move before their runners get back to Gul''dan.' WHERE `ID` = 38444;
UPDATE `quest_offer_reward` SET `RewardText` = 'The easy part is done, now comes the hard part.' WHERE `ID` = 38445;
UPDATE `quest_offer_reward` SET `RewardText` = 'This will be a difficult campaign to be sure.' WHERE `ID` = 38446;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, General. Our scouts just returned with word of your success.$B$BWell done!
' WHERE `ID` = 38449;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m sure your head is filled with questions. Answers will come, in time.$B$BI am Havi, and my words are those of the Valarjar - the glorious keepers of the Halls of Valor. $B$BYou will need my help if it is the Aegis you seek. Oh yes, I know your goals outsider. As I know many things...
' WHERE `ID` = 38459;
UPDATE `quest_offer_reward` SET `RewardText` = 'At last! A minion of my very own!' WHERE `ID` = 38460;
UPDATE `quest_offer_reward` SET `RewardText` = 'Of course! They''ve found their way around the welding problem by simply crafting their armor out of one solid piece of metal.$B$BThe shoulderpads I should have figured out on my own, but their work on the breastplate really is remarkable.$B$BHere, let me jot down a few patterns so you can make these yourself.
' WHERE `ID` = 38501;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hadn''t even thought far enough ahead to realize you''d need this to be translated, too. Good thinking.$B$BSee, this is why I keep adventurers like you around the shop.
' WHERE `ID` = 38507;
UPDATE `quest_offer_reward` SET `RewardText` = 'You, outsider, think yourself worthy of our wisdom?
' WHERE `ID` = 38513;
UPDATE `quest_offer_reward` SET `RewardText` = 'The craftsmanship is good, but the quality is feeble at best.$B$B<Barm snaps the gauntlets in half and throws them to floor>$B$BYou have proven yourself worthy of my tutelage however.
' WHERE `ID` = 38514;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see, the strength of their work comes from the technique of their hammer strikes. Very interesting...
' WHERE `ID` = 38518;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.$B$BThank you.
' WHERE `ID` = 38519;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me take those bars, make a few adjustments and...$B$BTa da! Hoofplates for your mount!
' WHERE `ID` = 38522;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that Mei''s fit the plates to your mount, you should be able to put them on easily yourself.$B$BOh, and before I forget, here''s the pattern. Enjoy!
' WHERE `ID` = 38523;
UPDATE `quest_offer_reward` SET `RewardText` = 'You here to lend us a hand?
' WHERE `ID` = 38524;
UPDATE `quest_offer_reward` SET `RewardText` = 'Not bad, $C. You know how to swing a hammer.
' WHERE `ID` = 38526;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. Now let''s get to work.
' WHERE `ID` = 38527;
UPDATE `quest_offer_reward` SET `RewardText` = 'Solid work.$B$BLeystone is a fickle metal. Its armguards benefit from the addition of brimstone, but to improve the production of shoulderpads? Enchanting dust. Helms benefit from uncarved gemstones. And so on.
' WHERE `ID` = 38528;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have returned, $n. Have you come for more training?$B$BWhat? The Firmament Stone?$B$B$B$BThat''s another matter entirely.
' WHERE `ID` = 38530;
UPDATE `quest_offer_reward` SET `RewardText` = 'A new face? It''s been years...$B$BThis is the Firmament Stone. Memorize her curves. Learn her intricacies. If you truly wish to push your smithing skill to the next level, I predict that you will be spending a lot of time at her side.
' WHERE `ID` = 38559;
UPDATE `quest_offer_reward` SET `RewardText` = 'More of my ancestors'' souls plundered by Gorefiend! This must end once and for all. Gorefiend must be put down!
' WHERE `ID` = 38562;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that that''s all taken care of, we can move on to improving our recipes.
' WHERE `ID` = 38563;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n. Now let''s put her to the test!
' WHERE `ID` = 38564;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve done it, Highlord $n.$B$BThe Order of the Silver Hand is reborn!' WHERE `ID` = 38566;
UPDATE `quest_offer_reward` SET `RewardText` = 'Commander! I was hoping some backup would arrive. This place is going crazy. The Iron Horde retreated from the Foundry and now, under Gul''dan''s orders, they''re using these docks to flee to Tanaan.$B$BBut my people found something that might interest you, if you act fast...
' WHERE `ID` = 38568;
UPDATE `quest_offer_reward` SET `RewardText` = 'We confirmed that Solog Roark is aboard this prison train, but it''s locked up tight. Oh - you brought explosives? Hmph. Those goblin friends of yours are always prepared.$B$BLet''s bust this box open and convince that shipwright to join our cause...
' WHERE `ID` = 38570;
UPDATE `quest_offer_reward` SET `RewardText` = 'Lower your weapon, stranger. Blackhand is dead and our new "Warchief" just signed my death sentence. It looks like I''m going mercenary.$B$BYou want to build a shipyard? Then you want me.
' WHERE `ID` = 38571;
UPDATE `quest_offer_reward` SET `RewardText` = '<Solog Roark scans the horizon.>$B$BThis will do. It''s a good deepwater harbor. We can gut that old warship down there to make your first transport. Moving supplies up and down these cliffs will be a chore, but they''ll give us additional security in case we''re attacked.$B$BWe''ll make it work. Are you ready to get building?
' WHERE `ID` = 38574;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is fitting that you are here.$b$bTime and again, you have fought to save our world. Now, I fear I must ask you to undertake an even greater act of service.' WHERE `ID` = 38576;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now you see what we face here. We will keep as much pressure here as we can so your base can remain free to attack all over the jungle.
' WHERE `ID` = 38577;
UPDATE `quest_offer_reward` SET `RewardText` = 'We will speak more of this later, but thank you.' WHERE `ID` = 38578;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now you see what we face here. We will keep as much pressure here as we can so your base can remain free to attack all over the jungle.' WHERE `ID` = 38581;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hey welcome back! The signal''s coming in loud and clear and the ship''s good to go!$B$BWhen you''re ready to head back up just take the rocket for the fastest ride on Draenor! We set it up over near Gargash.
' WHERE `ID` = 38599;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back!$b$bWe''re getting a strong feed from those sensors! The crew locked the navigation system on to the signal and everything should be good to go!$b$bWe set the machine up next to Skyguard Thann.' WHERE `ID` = 38603;
UPDATE `quest_offer_reward` SET `RewardText` = 'These vrykul are so boring! Why does Nathanos send me on missions like this? Does he really think the Aegis is here?$B$BI hope you''ve come to stir up some trouble.
' WHERE `ID` = 38611;
UPDATE `quest_offer_reward` SET `RewardText` = 'Those vrykul were so distracted seeing someone flying through their village, they never noticed me slip by. $B$BI hope that didn''t get you too much unwanted attention.
' WHERE `ID` = 38613;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well, the sizing might be a bit big, but I think you can make them work. $B$BThat path doesn''t look pleasant, so it''ll help to be prepared.
' WHERE `ID` = 38614;
UPDATE `quest_offer_reward` SET `RewardText` = 'We won''t have to worry about those scrap heaps anymore! $B$BIt looks like we''ve got a hitch in our plan though. That bridge was the only way up.
' WHERE `ID` = 38615;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good thinking. If the vrykul can use the drake scales for their armor, why not us? $B$BIt shouldn''t be too tough to work this into something serviceable.
' WHERE `ID` = 38616;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are here for the trial? I''m afraid you might be too late.$B$BThis battle with these Felskorn has taken its toll. I am too weak to grant you the power you seek...$B$BBut perhaps you may be able to help...
' WHERE `ID` = 38618;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m sorry for my suspicion earlier. We''re all on edge with the recent attacks.$B$BI couldn''t be more grateful to you and your friend.$B$BThanks to you, our situation is under control now. We''ve got a lot of rebuilding to do, but we''ll survive.' WHERE `ID` = 38644;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. These innocent villagers have done nothing to deserve these attacks. You have done well to help them.' WHERE `ID` = 38645;
UPDATE `quest_offer_reward` SET `RewardText` = 'Something is amiss. I can feel it in my bones.' WHERE `ID` = 38649;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. You spent many years in stasis, but I see that your senses have not dulled.



<Maiev eyes your weapons warily.>



Raise your hand against me, demon hunter, and you will find out why I was your master''s jailor.
' WHERE `ID` = 38669;
UPDATE `quest_offer_reward` SET `RewardText` = 'The waking world is slipping further and further from my mind. But on the vestiges of this corruption consuming my mind, I sense Malfurion!' WHERE `ID` = 38684;
UPDATE `quest_offer_reward` SET `RewardText` = 'This cannot be!' WHERE `ID` = 38687;
UPDATE `quest_offer_reward` SET `RewardText` = 'The color has returned to your face, $n.
' WHERE `ID` = 38689;
UPDATE `quest_offer_reward` SET `RewardText` = 'We always knew the Illidari would be called upon to defend this world. It is why we sacrificed everything to become who... WHAT... we are.
' WHERE `ID` = 38690;
UPDATE `quest_offer_reward` SET `RewardText` = 'What does the Legion want with Ravencrest? He was dead and buried ten millennia ago.' WHERE `ID` = 38691;
UPDATE `quest_offer_reward` SET `RewardText` = 'It had to be done.' WHERE `ID` = 38692;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oculeth has anticipated our arrival. Good, one less thing to worry on.' WHERE `ID` = 38694;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for helping us gather together, $n. We must stand united.' WHERE `ID` = 38710;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, $n. There is no doubt that they have already moved Maiev into the prison cells beneath the tower.' WHERE `ID` = 38714;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, these keys should open any of the cells within the prison.' WHERE `ID` = 38717;
UPDATE `quest_offer_reward` SET `RewardText` = 'The attacking spirits spoke of their lord and master. I fear the Legion has raised Lord Ravencrest to do their bidding. What price was paid for such a sinister revival, I do not know.' WHERE `ID` = 38718;
UPDATE `quest_offer_reward` SET `RewardText` = 'The other Illidari did not make it, but I owe you my life. There is one thing I learned during my time in the prisons: the demons within Black Rook Hold must die.' WHERE `ID` = 38719;
UPDATE `quest_offer_reward` SET `RewardText` = 'Lord Stareye came from a noble house, but in war, he never came close to Ravencrest or my brother.$B$BNow that he is defeated, we can turn our attention to his commander.$B$BHowever, that will be no easy task. We must gather our strength before facing Lord Ravencrest himself.' WHERE `ID` = 38721;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. You have absorbed the powers of these brutes. Look how strong you have grown!
' WHERE `ID` = 38723;
UPDATE `quest_offer_reward` SET `RewardText` = 'True leadership is hard to come by. Leading from the front is an even rarer trait.$B$BWe are just about ready to assail Brood Queen Tyranna''s command center.
' WHERE `ID` = 38727;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that we have the keystone in our possession, there is just one last thing left to do...
' WHERE `ID` = 38728;
UPDATE `quest_offer_reward` SET `RewardText` = 'So it was your footsteps I felt upon my woods as the runestones released their grip? $B$BYou have my thanks, outsider.' WHERE `ID` = 38778;
UPDATE `quest_offer_reward` SET `RewardText` = 'This came from a blasted infernal? Look out, we''ve got $gmister:little miss; COMBAT miner, here!$b$bSome o'' this ore seems to ''ave lost its shine on the trip back, however. Next time, make sure to cut out the sword and spell wounds before ye mine it.' WHERE `ID` = 38797;
UPDATE `quest_offer_reward` SET `RewardText` = 'This odiferous morsel ye''ve brought me... it''s infernal brimstone, isn''t it?$B$BAmazing.$B$BI''ve heard tales, but I''ve never actually SEEN the stuff before.$B$BI''ve got to study this. In the meantime, here''s all I know about this rare, rare ore.
' WHERE `ID` = 38806;
UPDATE `quest_offer_reward` SET `RewardText` = 'These hearts are fat and bloody. $B$BThe slumbering rulers will not refuse an offering of Bjornharta.' WHERE `ID` = 38808;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ashildir''s grave has been disturbed, outsider. $B$BDo you know something of this?' WHERE `ID` = 38811;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our forces have engaged the Legion.

Soon we will stand together victorious with Lord Illidan at the Black Temple.' WHERE `ID` = 38813;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your glorious battle honors the Valkyra queen.' WHERE `ID` = 38816;
UPDATE `quest_offer_reward` SET `RewardText` = 'The treachery of the Bonespeakers knows no limit. $B$BTheir rituals seek to sunder the very essence of our queen, but we will use their own magic to return her to us!' WHERE `ID` = 38817;
UPDATE `quest_offer_reward` SET `RewardText` = 'A cannot believe this fate... $B$BI am sorry, outsider, for I had underestimated Faljar''s power.$B$BThat he could banish us here... is unthinkable.' WHERE `ID` = 38818;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am in complete agreement. From where I''m standing, you utterly decimated their forces.$B$BWhat do you think? Are we ready to fly up to that command center and take the Sargerite Keystone?
' WHERE `ID` = 38819;
UPDATE `quest_offer_reward` SET `RewardText` = 'These mystics have gone to great lengths to weaken Ashildir. $B$BWe must hope that her spirit is strong enough for the wakening.' WHERE `ID` = 38823;
UPDATE `quest_offer_reward` SET `RewardText` = 'The two of you are a welcome sight. We pushed the demons out of these ruins, but they are stronger than any we have encountered before.

Your help is appreciated. If we do not crush this Legion invasion now, they will overrun Azsuna and then the rest of the Broken Isles.' WHERE `ID` = 38834;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent, my good $g sir:lady;. I cannot thank you enough for the freedom of my people. Rosh is especially appreciative.

<Gentle Rosh grunts.>

Perhaps you and I can do some more business together.' WHERE `ID` = 38857;
UPDATE `quest_offer_reward` SET `RewardText` = 'Until I can discover what is vexing the Thistleleaf, I''ll have to look after the Lunarwing eggs. At least I know they will be safe.' WHERE `ID` = 38862;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hah! Greymane will find his cannons aren''t so useful when the blight takes his crew!
' WHERE `ID` = 38873;
UPDATE `quest_offer_reward` SET `RewardText` = 'I would hope that you bring me some good news, $C. $B$BFor both of our sake.
' WHERE `ID` = 38878;
UPDATE `quest_offer_reward` SET `RewardText` = 'That... is a lot of drogbar.' WHERE `ID` = 38915;
UPDATE `quest_offer_reward` SET `RewardText` = 'NICE WORK. TOO BAD THE ALLIANCE IS STILL BEATING DOWN OUR GATES! GET BACK OUT THERE!
' WHERE `ID` = 38923;
UPDATE `quest_offer_reward` SET `RewardText` = 'NICE WORK. TOO BAD THE ALLIANCE IS STILL BEATING DOWN OUR GATES! GET BACK OUT THERE!
' WHERE `ID` = 38924;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done. That will give the Horde something to think about next time they decide to test us here in Ashran.
' WHERE `ID` = 38925;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now is the time to strike back against the Legion.' WHERE `ID` = 38933;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Lich King made a wise choice in giving you those blades, $n. You''ve more then proven yourself worthy of them.$B$BI have to admit though, I''m glad it wasn''t me, I''m through with having magical weapons dictate my fate.
' WHERE `ID` = 38990;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, $n, you have returned. An otherworldly air hangs heavy about you.
' WHERE `ID` = 39020;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, $n, you have returned. An otherworldly air hangs heavy about you.
' WHERE `ID` = 39021;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your battle skills are impressive.' WHERE `ID` = 39026;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n. Fortunately, a skilled diviner can use Apexis crystals to reveal oil deposits beneath the earth. I cannot teach you this art, but you may nevertheless reap its benefit.
' WHERE `ID` = 39033;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s new. She looks like some kind of spider demon. As if the Legion needed spiders...' WHERE `ID` = 39050;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hah, we''ll make you a sea-dog yet. Let''s get started on our first ship!' WHERE `ID` = 39054;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have our first ship!  Great work $n.  I will get to work preparing her for travel to Tanaan right away.' WHERE `ID` = 39055;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great work Commander!  You are going to make a great captain one day.' WHERE `ID` = 39056;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good you arrived when you did, $n.' WHERE `ID` = 39059;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. The puzzle is finally coming together. $B$BWe may not know why Sylvanas'' forces are here, but I think we know where they are.' WHERE `ID` = 39061;
UPDATE `quest_offer_reward` SET `RewardText` = 'I love the smell of fresh-cut wood and tar! Are you ready to start construction?' WHERE `ID` = 39082;
UPDATE `quest_offer_reward` SET `RewardText` = 'NICE WORK. TOO BAD THE ALLIANCE IS STILL BEATING DOWN OUR GATES! GET BACK OUT THERE!
' WHERE `ID` = 39090;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to see you, $n. $B$BThe assault on Dreadwake''s Landing fared poorly, and I had thought our cause lost until Crowley informed me of your success.$B$BNow, let''s finish this!' WHERE `ID` = 39092;
UPDATE `quest_offer_reward` SET `RewardText` = 'Eh, ya got dem all! Dat''s wonderful for the both of us. I can give ya dis much...
' WHERE `ID` = 39107;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re awake! We nearly lost you there... $B$BIt''s a good thing we managed to get you and Greymane out of there in time, otherwise we wouldn''t have been able to reverse Sylvanas''s poison. It''s a shame she got away, but her plans in Skold-Ashil failed and we have you to thank for it. $B$BI''m sure Greymane will order a commendation for you once he is fully recovered. You did a great thing here, $n. $B$BGilneas is in your debt.' WHERE `ID` = 39122;
UPDATE `quest_offer_reward` SET `RewardText` = 'Not a scratch on ya that I can see. I bet those lions never saw ya comin''!' WHERE `ID` = 39123;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve hunted the Highmountain Elderhorn and lived to tell about it. That''s not a feat that most can say they''ve accomplished. Color me impressed.' WHERE `ID` = 39124;
UPDATE `quest_offer_reward` SET `RewardText` = 'The subject died during the testing process? Well that was unexpected.$B$BNonetheless, you''ve held up your end of the bargain. I suppose it''s time for me to fulfill mine.
' WHERE `ID` = 39142;
UPDATE `quest_offer_reward` SET `RewardText` = 'It looks like the ravens will feast on worgen flesh today, $C.$B$BWell done.
' WHERE `ID` = 39153;
UPDATE `quest_offer_reward` SET `RewardText` = 'You seem surprised to find me here? I was surprised as well, to find that my forces were unable to even breach the city of these cursed vrykul! $B$BThe time has come to employ some different tactics, and your arrival couldn''t have been more fortuitous.
' WHERE `ID` = 39154;
UPDATE `quest_offer_reward` SET `RewardText` = 'These antlers are going to look quite impressive hanging from the walls of the hunters'' lodge.' WHERE `ID` = 39178;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re quite resourceful. I can see why Ritssyn likes to send you on errands.
' WHERE `ID` = 39179;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work $n! You see the mess the Alliance has made I''m sure.
' WHERE `ID` = 39233;
UPDATE `quest_offer_reward` SET `RewardText` = 'I love the smell of fresh-cut wood and tar! Are you ready to start construction?
' WHERE `ID` = 39236;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hah, we''ll make you a sea-dog yet. Let''s get started on our first ship!
' WHERE `ID` = 39241;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great work Commander! You are going to make a great captain one day.
' WHERE `ID` = 39243;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great work! We will get to work right away on the upgrade.
' WHERE `ID` = 39245;
UPDATE `quest_offer_reward` SET `RewardText` = 'Controlling the seas of Draenor is in our grasp!
' WHERE `ID` = 39246;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have much to do, and precious little time to do it.
' WHERE `ID` = 39261;
UPDATE `quest_offer_reward` SET `RewardText` = 'I KNEW that I''d sensed something foul!' WHERE `ID` = 39262;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $r. Some of the crops still live. I believe with hard work and some of Jale''s magical waters, we will not lose the entire harvest.' WHERE `ID` = 39272;
UPDATE `quest_offer_reward` SET `RewardText` = 'Interested in shipbuilding, I see?  I will do everything I can to help out, commander.' WHERE `ID` = 39276;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great! I''m always here if ye'' ever want to change your mind!' WHERE `ID` = 39313;
UPDATE `quest_offer_reward` SET `RewardText` = 'They have returned relatively unharmed. Thank you, $n.' WHERE `ID` = 39316;
UPDATE `quest_offer_reward` SET `RewardText` = 'Julan is dead? He was a good shaman and full of life. Not as morbid as some of these spiritwalkers.$b$bI will miss his laughter tonight.' WHERE `ID` = 39318;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done. Now to cut the head off the snake, as it were.' WHERE `ID` = 39321;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have our respect and honor, $p. I name you Skyfriend, and grant you free passage through our lands at your discretion.' WHERE `ID` = 39322;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh thank you traveler! You have truly helped the forest today.' WHERE `ID` = 39354;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a blueprint for some high tech naval equipment. I should be able to reverse engineer the plans and have this equipment available for you shortly!
' WHERE `ID` = 39356;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a blueprint for some high tech naval equipment. I should be able to reverse engineer the plans and have this equipment available for you shortly!
' WHERE `ID` = 39358;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a blueprint for some high tech naval equipment. I should be able to reverse engineer the plans and have this equipment available for you shortly!
' WHERE `ID` = 39359;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a blueprint for some high tech naval equipment. I should be able to reverse engineer the plans and have this equipment available for you shortly!
' WHERE `ID` = 39360;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a blueprint for some high tech naval equipment. I should be able to reverse engineer the plans and have this equipment available for you shortly!
' WHERE `ID` = 39363;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a blueprint for some high tech naval equipment. I should be able to reverse engineer the plans and have this equipment available for you shortly!
' WHERE `ID` = 39364;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a blueprint for some high tech naval equipment. I should be able to reverse engineer the plans and have this equipment available for you shortly!
' WHERE `ID` = 39366;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Bloodtotem don''t often allow outsiders into their midst. Even asking them to give you an audience is a danger.' WHERE `ID` = 39372;
UPDATE `quest_offer_reward` SET `RewardText` = 'I could hear them screeching from here. With this victory and the defeat of the Witch of the Wood, Torok will surely be willing to see you.' WHERE `ID` = 39373;
UPDATE `quest_offer_reward` SET `RewardText` = 'Strange that he would be in the cavern at this time... perhaps this is a good sign?' WHERE `ID` = 39374;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have little reason to trust me, but we have a common enemy in the Bloodtotem and I could use your help.' WHERE `ID` = 39381;
UPDATE `quest_offer_reward` SET `RewardText` = 'By the Dark Lady''s favor, you did it! I witnessed the explosion from here - there''s no way that Greymane could have survived such destruction! $B$BYou have done a great deed today for the Forsaken. Rest assured, it will be remembered.
' WHERE `ID` = 39385;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Skyhorn are with us? This day just got much better.' WHERE `ID` = 39387;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Bloodstone looks sated. Well done! Now it''s time for a test...
' WHERE `ID` = 39389;
UPDATE `quest_offer_reward` SET `RewardText` = 'They lured us into a trap, commander.  I want revenge!' WHERE `ID` = 39404;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s good to hear that Razik is makin'' some progress on his gadgets.$B$BMaybe if he could design a gun that aims itself, these amateurs infesting the basin would hit their targets for once.
' WHERE `ID` = 39417;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done the Skyhorn a great service, $n.' WHERE `ID` = 39419;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have been waiting for you, Commander.
' WHERE `ID` = 39423;
UPDATE `quest_offer_reward` SET `RewardText` = 'This will help me repair my broken body.' WHERE `ID` = 39425;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have earned my trust. The Stonedark are not yet safe from our brothers led by Dargrul the Underking. We would willingly join Mayla Highmountain and her tauren against them.' WHERE `ID` = 39426;
UPDATE `quest_offer_reward` SET `RewardText` = 'Haha! You are covered in the feathers of your enemies.' WHERE `ID` = 39429;
UPDATE `quest_offer_reward` SET `RewardText` = 'As your archmage told me, the power that has warped these crystals comes from far beyond this world. I will need more help in discovering how to turn back the darkness inside my people.' WHERE `ID` = 39432;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will continue to need your help until this world is free of whatever terrible presence Gul''dan has invited to destroy us.' WHERE `ID` = 39433;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found them! Not sure how you carried them all at one time...' WHERE `ID` = 39439;
UPDATE `quest_offer_reward` SET `RewardText` = 'Stronger than you look, little one.' WHERE `ID` = 39440;
UPDATE `quest_offer_reward` SET `RewardText` = 'Torok is dead? By... your hand? He must have truly given in to his thirst for blood if that came to pass.

The Stonedark on our side, though... That is an advantage I had not expected. Navarrogg has always been much more agreeable than Dargrul and his brood. Thank you for striking this rare alliance, $n.' WHERE `ID` = 39456;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have never seen a drogbar transform like that. The Hammer of Khaz''goroth is indeed powerful.' WHERE `ID` = 39487;
UPDATE `quest_offer_reward` SET `RewardText` = 'With the magic now spreading back into the cave, the balance of elements will be restored and the drogbar will not last long here.' WHERE `ID` = 39488;
UPDATE `quest_offer_reward` SET `RewardText` = 'The cave is nearly restored...' WHERE `ID` = 39489;
UPDATE `quest_offer_reward` SET `RewardText` = 'With fewer of those insects out there, I can tend to some of the crops.' WHERE `ID` = 39490;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now we have what they used to spray our fields. I wonder what use we could put this to...' WHERE `ID` = 39491;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m glad you arrived when you did. The drogbar are increasing their aggression as we speak.' WHERE `ID` = 39496;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, yes, this be the good stuff commander.$B$BI''ll send a messenger with these to your shipyard. Don''t you worry none, me hunters slip through this jungle like they was invisible.
' WHERE `ID` = 39510;
UPDATE `quest_offer_reward` SET `RewardText` = 'I get these to Lady Liadrin then.$B$BYou really think there be a way back for these monsters, commander? You got a brighter outlook then me, mon.
' WHERE `ID` = 39511;
UPDATE `quest_offer_reward` SET `RewardText` = 'You lugged that thing all the way back here? You must got a bit of gronn-blood yourself, commander!$B$BWe send this to the goblins at Orgrimmar to take a look at.
' WHERE `ID` = 39514;
UPDATE `quest_offer_reward` SET `RewardText` = 'I blame myself, $n. Mannethrel was already struggling. It is a never-ending battle we all must endure... to control the fel energies that we have taken in.$B$BMaybe it would be best if you held off teaching the others for now. We can not afford to lose anyone else.
' WHERE `ID` = 39515;
UPDATE `quest_offer_reward` SET `RewardText` = 'I blame myself, $n. Mannethrel was already struggling. It is a never-ending battle we all must endure... to control the fel energies that we have taken in.$B$BMaybe it would be best if you held off teaching the others for now. We can not afford to lose anyone else.
' WHERE `ID` = 39516;
UPDATE `quest_offer_reward` SET `RewardText` = 'How does it feel, $n? To look the Burning Legion directly in the eye and to tell them... "Not today."
' WHERE `ID` = 39519;
UPDATE `quest_offer_reward` SET `RewardText` = 'You done it, commander! Day by day, we be conquerin'' this whole Jungle.
' WHERE `ID` = 39526;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, this is quite the collection. How many of these sunk into your flesh? Exhilarating, isn''t it?
' WHERE `ID` = 39529;
UPDATE `quest_offer_reward` SET `RewardText` = 'You gave them the glorious death they craved, $n. Soon Gul''dan will have no one left to do his dirty work.
' WHERE `ID` = 39532;
UPDATE `quest_offer_reward` SET `RewardText` = 'What terrible instruments these are! We will learn what we can from these and then destroy them.
' WHERE `ID` = 39567;
UPDATE `quest_offer_reward` SET `RewardText` = 'Moozy! Thank the spirits you are okay! Oh thank you for returning him to me. Thank you!' WHERE `ID` = 39572;
UPDATE `quest_offer_reward` SET `RewardText` = 'My word, that device is enormous. Thank you for carrying it all the way back here.$B$BThere is so much my people can still learn about this world!
' WHERE `ID` = 39573;
UPDATE `quest_offer_reward` SET `RewardText` = 'Quite a drop. Mind yourself in here, this is not a safe place.' WHERE `ID` = 39575;
UPDATE `quest_offer_reward` SET `RewardText` = 'Nice! You''re quite the slayer, $n. Gimmie a low-five!' WHERE `ID` = 39581;
UPDATE `quest_offer_reward` SET `RewardText` = 'Their numbers are fewer, but still they threaten our safety.' WHERE `ID` = 39588;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have learned of the obstacles you must face. $B$BDo you still wish to continue?' WHERE `ID` = 39591;
UPDATE `quest_offer_reward` SET `RewardText` = 'The knowledge you''ve gained is a powerful tool to use against your foes. $B$BDo not forget this.' WHERE `ID` = 39592;
UPDATE `quest_offer_reward` SET `RewardText` = 'The trial is done, and you emerge victorious! $B$BIt is a great feat you have done here, but you are not through yet. Many great challenges await you on your path to the Aegis.' WHERE `ID` = 39594;
UPDATE `quest_offer_reward` SET `RewardText` = 'I appreciate your gifts, outsider. You show great respect to the trials. $B$BYou do well to honor our ways.' WHERE `ID` = 39595;
UPDATE `quest_offer_reward` SET `RewardText` = 'The trial is done and you yet live. This land is full of wonders, yes?$B$BBut it looks like the God-King intends to give you trials on top of trials. Still you must hurry, for even now, the next awaits!' WHERE `ID` = 39597;
UPDATE `quest_offer_reward` SET `RewardText` = 'I look forward to seeing your impressive fleet of battleships, commander.' WHERE `ID` = 39601;
UPDATE `quest_offer_reward` SET `RewardText` = 'I look forward to seeing your impressive fleet of battleships, commander.
' WHERE `ID` = 39604;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. You saved enough fish that they can breed a new population.' WHERE `ID` = 39614;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are truly a hero to my brood.  $B$BYou have gained a powerful ally today, outsider. The God-King has reason to fear you.' WHERE `ID` = 39652;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was an amazing turn around commander!  Great work.' WHERE `ID` = 39655;
UPDATE `quest_offer_reward` SET `RewardText` = 'Are you ready? We are about to enter a cave... and the drogbar are at home in such dark places.' WHERE `ID` = 39661;
UPDATE `quest_offer_reward` SET `RewardText` = 'Can you sense her power? It will take all of you combined.$B$BEven so... I better go secure our way out of here.
' WHERE `ID` = 39663;
UPDATE `quest_offer_reward` SET `RewardText` = 'Equipment can really make a difference out there!' WHERE `ID` = 39665;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hrm, these rabbits are a bit bigger than I thought, but we should still be able to stuff a few of them into the hand cannon.' WHERE `ID` = 39670;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. Words cannot express what this means to me.$B$BAnd as promised, here is a gift of knowledge to you.
' WHERE `ID` = 39680;
UPDATE `quest_offer_reward` SET `RewardText` = 'Are you alright? Most of my stock seems to be unharmed by the flames. It''s a good thing this wasn''t the tailoring shop.$B$BThe explosion seemed to happen when I applied the flux.$B$BNo flux means no welding. That''s a shame. Without the ability to weld, we''re limited to crafting belts and bracers.
' WHERE `ID` = 39681;
UPDATE `quest_offer_reward` SET `RewardText` = 'Kayn and Altruis said you would be coming. Just in time, $n.
' WHERE `ID` = 39682;
UPDATE `quest_offer_reward` SET `RewardText` = 'I had no doubt you would know what to do.
' WHERE `ID` = 39684;
UPDATE `quest_offer_reward` SET `RewardText` = 'I knew you could do it, $n. We could not let that creature escape.
' WHERE `ID` = 39685;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is serious. Their core ideals are in direct conflict.$B$BI fear they will take this duel to the death.
' WHERE `ID` = 39686;
UPDATE `quest_offer_reward` SET `RewardText` = 'We escaped the Vault, but our work is far from over.$B$BThe Legion''s assault on this world is just beginning.$B$BIf Azeroth is to survive, we may have to work with this... Archmage Khadgar.
' WHERE `ID` = 39688;
UPDATE `quest_offer_reward` SET `RewardText` = 'If you are ready, I will take you to our destination.$B$BAre you prepared to leave?
' WHERE `ID` = 39689;
UPDATE `quest_offer_reward` SET `RewardText` = 'If you are ready, I will take you to our destination.$B$BAre you prepared to leave?
' WHERE `ID` = 39690;
UPDATE `quest_offer_reward` SET `RewardText` = 'We escaped the Vault, but our work is far from over.$B$BThe Legion''s assault on this world is just beginning.$B$BIf Azeroth is to survive, we may have to work with this... Archmage Khadgar.
' WHERE `ID` = 39694;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do you understand the gravity of our task? If we do not fight for our future, we will not have one.
' WHERE `ID` = 39698;
UPDATE `quest_offer_reward` SET `RewardText` = 'Perfect. Up for a little trip down to Azsuna?' WHERE `ID` = 39718;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings champion. I am Warbrave Oro of the Highmountain tauren. I come on the winds of war to find you.' WHERE `ID` = 39733;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. You saved me. You saved us all.$B$BI was... outmatched. My relationship with the elements has changed since the events on Draenor. I have some soul-searching to do. $n, you must carry the Earthen Ring forward without me. You are the leader they need.
' WHERE `ID` = 39746;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good luck out there! We''re all in this together.' WHERE `ID` = 39756;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah this weapon is amazing! Do you see the souls of the damned dancing along its edge? Oh how they scream for release!$B$BYes... in their forms I can see how the blade must be shaped.
' WHERE `ID` = 39757;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh yes... that will do nicely!$B$BReturn after you''ve fed your blade another feast of souls and we will make it the most powerful weapon that''s ever existed!
' WHERE `ID` = 39761;
UPDATE `quest_offer_reward` SET `RewardText` = 'Is this all you could find?$b$bWhile I''m grateful to have these gems in my possession once again, it seems that there are still a few missing. I fear they''ve been broken, which means the demons within have escaped.' WHERE `ID` = 39764;
UPDATE `quest_offer_reward` SET `RewardText` = 'Some of them seem to be digging less enthusiastically, at the very least.' WHERE `ID` = 39768;
UPDATE `quest_offer_reward` SET `RewardText` = 'What you want, stinky?' WHERE `ID` = 39769;
UPDATE `quest_offer_reward` SET `RewardText` = 'You really are the chosen one, $n. I will gladly lay down my life for you.$B$BWherever you take the Earthen Ring, I will follow!
' WHERE `ID` = 39771;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank the spirits! These kobolds do not honor their ancestors in the way we do. I can rest peacefully now.' WHERE `ID` = 39772;
UPDATE `quest_offer_reward` SET `RewardText` = 'Uriah would not want me to waste time with tears. My mourning can wait until the escaped demons are trapped once again.' WHERE `ID` = 39773;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for you help, $n. I will honor Uriah''s memory by completing our journey to Azsuna and delivering the demon prisoners to Allari as planned.' WHERE `ID` = 39774;
UPDATE `quest_offer_reward` SET `RewardText` = 'That should slow these invaders down.' WHERE `ID` = 39776;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. Thank you, Champion.$b$bWe have managed to get the children and the wounded to safety thanks to your efforts.' WHERE `ID` = 39777;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Runewood will know peace once more with these Bonespeakers removed from the land. $B$BIt is a good beginning.' WHERE `ID` = 39788;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see you carry a branch of the Runewood. Then it was you who laid the spirits to rest? $B$BThough I do not know your purpose, outsider, I appreciate what you have done for our people.' WHERE `ID` = 39791;
UPDATE `quest_offer_reward` SET `RewardText` = 'Bound... twisted... $B$BThe Bonespeakers...' WHERE `ID` = 39796;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, the hero of the hour! We must waste no time! $B$BOur business at hand is most important if you wish to succeed in your trials!' WHERE `ID` = 39803;
UPDATE `quest_offer_reward` SET `RewardText` = 'A fine cut, I must say. $B$BYes, you will do well against the Bonespeakers, I think.' WHERE `ID` = 39804;
UPDATE `quest_offer_reward` SET `RewardText` = 'You and I have been through much together, $n. Now, you stand before me as Deathlord and leader of our order. I could not be more proud!$B$BThe battle against the Burning Legion will be hard fought and filled with peril. You should not embark on this alone, my friend.$B$BI will go wherever you command and I will kill whoever you wish me to kill.
' WHERE `ID` = 39816;
UPDATE `quest_offer_reward` SET `RewardText` = 'Free at last! $B$BThe kvaldir caught me while I was tryin'' to put together a plan to sneak past that foul dog, Guarm, and have had me locked up ever since! $B$BI thought surely my fate was sealed.' WHERE `ID` = 39837;
UPDATE `quest_offer_reward` SET `RewardText` = 'This appears to be what we need. $B$BNow, we can prepare for the battle ahead.' WHERE `ID` = 39849;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to have my shieldmaidens returned to my side. $B$BYou have gained allies today, but know you have also gained my gratitude.' WHERE `ID` = 39851;
UPDATE `quest_offer_reward` SET `RewardText` = 'The day is won. Now, we must collect our reward. $B$BLet us hope that Helya keeps her side of the bargain.' WHERE `ID` = 39853;
UPDATE `quest_offer_reward` SET `RewardText` = 'So the dead return from Helheim and back? An impressive feat. $B$BYour worth has been judged and the trial passed. $B$BNow, to your destiny. To the Halls of Valor!' WHERE `ID` = 39855;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve been eager to get my hands on this manuscript! I was startin'' to think the gnome had writer''s block.' WHERE `ID` = 39859;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for saving me. I hope now we can trust each other. We must if we are to defeat these Feltotem.' WHERE `ID` = 39860;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m relieved you''ve come, $n. We could certainly use another enchanter in the shop at a time like this.' WHERE `ID` = 39874;
UPDATE `quest_offer_reward` SET `RewardText` = 'That will certainly help us keep these demons at bay for much longer. We''re in your debt, $n.
' WHERE `ID` = 39877;
UPDATE `quest_offer_reward` SET `RewardText` = 'The spirits told me of your coming, outlander. Let us see if you are indeed the hero this land needs.$B$B<The tauren clears his throat.>$B$BPardon me. I know I come off as a bit dramatic. It''s just... well, these things have meaning for me.
' WHERE `ID` = 39878;
UPDATE `quest_offer_reward` SET `RewardText` = 'So, $R, you have discovered my home... all that is left of me.$B$BNot even enough to sustain my beloved enchantments...
' WHERE `ID` = 39903;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have brought back to me my most prized possession. For this I will grant you a bit of my knowledge.$B$BShould you wish to learn more, you only need bring me a few, small components.
' WHERE `ID` = 39904;
UPDATE `quest_offer_reward` SET `RewardText` = 'It was a good thing you were here to help me with that.$B$BI surely would have been killed by those spirits!
' WHERE `ID` = 39947;
UPDATE `quest_offer_reward` SET `RewardText` = 'The mists of this bay rot not only the wood of the ships, but the very souls of its inhabitants.$B$BBut it seems you have already discovered this.' WHERE `ID` = 39984;
UPDATE `quest_offer_reward` SET `RewardText` = 'What is this... I see? $B$BA friendly face... in a sea of foes?' WHERE `ID` = 40001;
UPDATE `quest_offer_reward` SET `RewardText` = 'You may deliver me to Thalyssra once my work here is complete.' WHERE `ID` = 40011;
UPDATE `quest_offer_reward` SET `RewardText` = 'From the look of it, I would expect such an herb to be fragile and delicate, but... it''s quite sturdy.$B$BOooh, look at these!
' WHERE `ID` = 40013;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found withered implements near an aethril bloom?$B$BHmm... you''re the third one today.
' WHERE `ID` = 40015;
UPDATE `quest_offer_reward` SET `RewardText` = 'I know this herb. I''ve seen it once before, in the Pandaria''s Valley of the Four Winds.$B$BThis is dreamleaf.
' WHERE `ID` = 40018;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is just as I suspected. The infested herb is dying... but this may be turned to our advantage.$B$BLook, herbalist. The dying dreamleaf has swollen with herbaceous extract. While harvesting the healthy dreamleaf is trivial, you can harvest enormous amounts of product from the infested ones.
' WHERE `ID` = 40019;
UPDATE `quest_offer_reward` SET `RewardText` = 'I feel the blight subsiding. Good.$B$BOur respite will not last forever, but look... even now, the dreamleaf has succumbed more of its bounty.
' WHERE `ID` = 40021;
UPDATE `quest_offer_reward` SET `RewardText` = 'Foxes.$B$BHuh.$B$BThat... that makes sense. I suppose I should have guessed that.$B$BWell, now that I feel sufficiently stupid, let''s look at these bits of flower, to see if there''s anything we can learn...
' WHERE `ID` = 40026;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found this near a snarl of fjarnskaggl?
' WHERE `ID` = 40030;
UPDATE `quest_offer_reward` SET `RewardText` = 'This book: "Herblore of the Ancients", seems promising, but several pages are ripped out. Shame.$B$BStill, there is much to learn in the others.$B$B<Kuhuine turns to a random page, flips a few pages back and...>$B$BSee, look at this technique here!
' WHERE `ID` = 40031;
UPDATE `quest_offer_reward` SET `RewardText` = 'This herb just disintegrated in your hand?$B$BFascinating...
' WHERE `ID` = 40034;
UPDATE `quest_offer_reward` SET `RewardText` = 'Any success? None?$B$BEven if you haven''t found success, your skills are improving. Don''t give up, herbalist.
' WHERE `ID` = 40035;
UPDATE `quest_offer_reward` SET `RewardText` = 'The blade is enchanted - of course it would be. I''m certain that we can replicate this enchantment here in Dalaran.$B$BShame that that herbalist wasn''t more agreeable. There may have been more that we could have learned from him. At least he''s still alive out there, somewhere...
' WHERE `ID` = 40037;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh. I don''t like this herb at all. I''m fascinated, but I don''t like it.$B$B<Kuhuine peers into the center of the plant.>$B$BLook at the size of these seeds, $n. We can use these. Make sure you harvest them carefully next time.
' WHERE `ID` = 40040;
UPDATE `quest_offer_reward` SET `RewardText` = 'Much of this is very technical and mundane, but Ryno''s analysis can be applied right away.$B$BLook at this, here...
' WHERE `ID` = 40041;
UPDATE `quest_offer_reward` SET `RewardText` = 'Murky''s gained quite the following, hasn''t he? Perhaps they can help him out.' WHERE `ID` = 40045;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Naglfar...$B$BSo Helya''s kvaldir can navigate the mists?' WHERE `ID` = 40046;
UPDATE `quest_offer_reward` SET `RewardText` = 'The pufferfish will be a perfect resource for Murky! I''ll just whip up a spell to make them grow more quickly.

All he''ll have to do is throw, then boom!' WHERE `ID` = 40047;
UPDATE `quest_offer_reward` SET `RewardText` = 'Murky seems to have gotten a very strong slime ability due to this slimeweed. Fantastic!' WHERE `ID` = 40049;
UPDATE `quest_offer_reward` SET `RewardText` = 'Surprising. I agree. Well chosen, $n.$B$BNow, you must teach the rest of us.
' WHERE `ID` = 40051;
UPDATE `quest_offer_reward` SET `RewardText` = 'With the God-King''s defeat, the Aegis of Aggramar is yours to claim.' WHERE `ID` = 40072;
UPDATE `quest_offer_reward` SET `RewardText` = 'That ought to get their attention.

Now, onto the business of summoning in the rest of our forces.' WHERE `ID` = 40077;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is clear that your cooking prowess is only matched by your might in combat. $B$BNow, on full bellies, we ride to Valhallas!' WHERE `ID` = 40078;
UPDATE `quest_offer_reward` SET `RewardText` = 'This cave will make a great base for the young tadpoles!' WHERE `ID` = 40102;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to know that our warriors remains have been honored.$B$BMay they now celebrate their victories in the halls of Valhallas.' WHERE `ID` = 40120;
UPDATE `quest_offer_reward` SET `RewardText` = 'This corruption - I''ve never seen it before.$b$bAnd yet, it seems somehow familiar...' WHERE `ID` = 40122;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mm. This is better.$B$BKeep my advice in mind the next time you take out your skinning knife.
' WHERE `ID` = 40132;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very good, $n. Greater understanding of the stormscale leads to more efficient skinning, which in turn leads to fewer unnecessary animal deaths.
' WHERE `ID` = 40142;
UPDATE `quest_offer_reward` SET `RewardText` = 'I know very little about demonic hides, $n. I prefer to stay away from them.$B$BThat said, I will share with you what I do know...
' WHERE `ID` = 40156;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have seen only a taste of what Huln Highmountain accomplished during his lifetime. Let us delve deeper into the past...' WHERE `ID` = 40167;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, interesting! $B$B<Cupri quickly grabs the vial and studies it intensely.> $B$BPerhaps Zeph was right to keep investigating here. This vial certainly didn''t originate from any currently known timeline. Most curious! Thank you for bringing it to me. Or did you already bring it once before?
' WHERE `ID` = 40168;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ya seem to have a gift when it comes to dealin'' with amateurs. Maybe ya can help my ghostwriter, Addie?$b$bI''ve promised to teach her how to hunt, but I don''t have time to show her the basics.' WHERE `ID` = 40170;
UPDATE `quest_offer_reward` SET `RewardText` = 'Pleasure to meet ye! Now, I''ll be needing ye to do one very important thing fer me.$B$BIgnore anything me brother tells ye. He''s been out of practice fer years, but still thinks he''s better than me.$B$BIt''s a lie, lad.
' WHERE `ID` = 40180;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n. Here''s a copy of that pattern to add to your collection.$B$BI personally specialize in softer leather armor. If you want to make a MAIL helm, talk to Ranid... although I''m sure he''ll charge you a pretty penny for it.
' WHERE `ID` = 40183;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see.$B$BThat shouldn''t be too difficult to make.
' WHERE `ID` = 40196;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve got the plans. You have the leather?
' WHERE `ID` = 40197;
UPDATE `quest_offer_reward` SET `RewardText` = 'Awww, my pets are going to look so cute sitting on this. Well, most of them will. Probably not all of them.
' WHERE `ID` = 40201;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that''s a beast worth riding. Here''s the pattern for that harness, if you want one for yourself.
' WHERE `ID` = 40215;
UPDATE `quest_offer_reward` SET `RewardText` = 'You haven''t got any holes in ya, I guess that means Addie''s aim isn''t as bad as I thought!' WHERE `ID` = 40216;
UPDATE `quest_offer_reward` SET `RewardText` = 'We gave up usin'' that kind of ammo long ago! Don''t worry though, we won''t let the gift go to waste. I''m sure we can use the arrows for kindling.' WHERE `ID` = 40217;
UPDATE `quest_offer_reward` SET `RewardText` = 'It appears Kira travels faster than your word. She arrived moments ago, though her eyes purposely avoided mine.$B$BIn gaining her trust, you accomplished something I could not. With her help, we should be able to summon the gateway.
' WHERE `ID` = 40218;
UPDATE `quest_offer_reward` SET `RewardText` = 'That should set those vexing Thorndancers on their way.' WHERE `ID` = 40220;
UPDATE `quest_offer_reward` SET `RewardText` = 'On behalf of the Lunarwings, thank you.' WHERE `ID` = 40221;
UPDATE `quest_offer_reward` SET `RewardText` = 'The orcs had a prophecy about the Doomhammer. It was said that a stranger will raise the hammer high, and with it, justice shall reign. Maybe... maybe YOU were meant to be that stranger all along.$B$BCome, $n. The Earthen Ring needs you. And Azeroth needs us.
' WHERE `ID` = 40224;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Earthen Ring rises once more to defend Azeroth. You will be our Farseer, $n, and we will be your instruments. Only by working together can we preserve our world.$B$BWe are yours to command, Farseer.
' WHERE `ID` = 40225;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honeyed words from a stranger. While comforting, they do not shake my resolve. Come, at this rate I will wither before we are through.' WHERE `ID` = 40227;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did it! Murky will make a great leader for the next generation of the murlocs here.

I can''t help but feel sad over losing my little buddy, but you''ve got to let them go sometime.' WHERE `ID` = 40230;
UPDATE `quest_offer_reward` SET `RewardText` = 'Finally! Today is da day I can get out of here!$B$BIf not I''ll need more of dem to try again.
' WHERE `ID` = 40235;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''d say thanks, but I''m pretty sure that us shutting down the Foundry helps you out more than it helps us. So you''re welcome.
' WHERE `ID` = 40237;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work. They will return in time, but we can use this advantage.' WHERE `ID` = 40238;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hello, adventurer! Here to help me and Murky out?' WHERE `ID` = 40244;
UPDATE `quest_offer_reward` SET `RewardText` = 'It pleases me that you have brought life to my beloved enchantments.$B$BOnce I could accomplish much more than mere parlor tricks... until the source of my power was stolen from me.
' WHERE `ID` = 40265;
UPDATE `quest_offer_reward` SET `RewardText` = 'I sense that your work here has only begun. As you get more familiar with your artifact, you will be able to continue augmenting its power.$B$BThe others are watching you carefully. You have become a symbol of hope in our struggle against the Legion!
' WHERE `ID` = 40276;
UPDATE `quest_offer_reward` SET `RewardText` = 'My name is Lyana. What is yours, $c?

You have my gratitude for releasing me.

I do not know how long I have been held captive... but I sense an overwhelming number of demons nearby.

We have much to do here, you and I.' WHERE `ID` = 40297;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hmph. I suppose if you''re assisting me with my task, I should learn your name.$b$b<Thaedris reaches into the book and pulls out an unfamiliar, dried plant.>$b$bThank you for fetching me another one of the ingredients. Your assistance is... welcome, $n.' WHERE `ID` = 40306;
UPDATE `quest_offer_reward` SET `RewardText` = 'These relics are tokens and mementos of the former lives of those interred here. They like to be remembered and these offerings keep them in their eternal peace.$b$bThe spirits of the fallen will be at rest now. You have my gratitude.' WHERE `ID` = 40308;
UPDATE `quest_offer_reward` SET `RewardText` = 'You saw Latara? What happened?$b$b... I see. I am so sorry I failed you, my love.' WHERE `ID` = 40319;
UPDATE `quest_offer_reward` SET `RewardText` = 'My kin are safe. Let us see to these serpents!' WHERE `ID` = 40320;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. You have given me clarity of purpose and a reason to live again. Together we will save Suramar and atone for the sins of my people.' WHERE `ID` = 40321;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. Let us see what we can learn.' WHERE `ID` = 40324;
UPDATE `quest_offer_reward` SET `RewardText` = 'The withered... Not only do they suffer a burning thirst for the Nightwell, but their own memories torture them as well.$B$BTruly a fate worse than death...' WHERE `ID` = 40325;
UPDATE `quest_offer_reward` SET `RewardText` = 'The destruction of the soul is a fate far worse than death. You have done a great service to those you saved.' WHERE `ID` = 40328;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will wear this in honor of Throndyr!' WHERE `ID` = 40331;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hail Jarl Throndyr. May your soul find its place in Valhalas.' WHERE `ID` = 40332;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done it, $n. You have slain the Tidemistress and saved Jandvik from the Sashj''tar.' WHERE `ID` = 40336;
UPDATE `quest_offer_reward` SET `RewardText` = 'What you doing back so soon?' WHERE `ID` = 40339;
UPDATE `quest_offer_reward` SET `RewardText` = 'So the legends of the Scepter of Tides were true, $n!$B$BIt lifts our spirits to have such a powerful artifact in the hands of the Earthen Ring.
' WHERE `ID` = 40341;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that we have cleared out the corruption the fresh water elementals will be able to flourish.' WHERE `ID` = 40348;
UPDATE `quest_offer_reward` SET `RewardText` = 'There is no glory or honor in being digested.' WHERE `ID` = 40364;
UPDATE `quest_offer_reward` SET `RewardText` = 'These will do nicely.' WHERE `ID` = 40368;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see. I support you no matter your choice. With this new beginning, we shall rebuild the Illidari.
' WHERE `ID` = 40373;
UPDATE `quest_offer_reward` SET `RewardText` = 'I saw them run by. Not the most impressive of our troops, but the Ashtongue have proven effective in the past.' WHERE `ID` = 40378;
UPDATE `quest_offer_reward` SET `RewardText` = 'Grim business, but we''ve all sacrificed just about everything to get to where we are.

We will do ANYTHING it takes to defeat the Burning Legion. Anything.' WHERE `ID` = 40379;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your reputation precedes you, $n.$b$bIt is important that we speak.' WHERE `ID` = 40384;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Farstriders have been interrogating captured demons.$B$BOne of the vile creatures claims to know the whereabouts of someone... crucial to our cause.
' WHERE `ID` = 40392;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope for both of our sakes that you were not followed. We must work quickly, considering how close I am.' WHERE `ID` = 40401;
UPDATE `quest_offer_reward` SET `RewardText` = 'The time to make our move is now.
' WHERE `ID` = 40403;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent choice! There''s no time to waste.' WHERE `ID` = 40408;
UPDATE `quest_offer_reward` SET `RewardText` = 'With Azoran slain, the Legion has been dealt a crippling blow that they will not soon recover from.$b$bYou have my respect, $n.' WHERE `ID` = 40412;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. Your part here is done.$b$bRest assured knowing that you have done me a great service.$b$bHere, take this payment. It is a small token for your service.' WHERE `ID` = 40424;
UPDATE `quest_offer_reward` SET `RewardText` = 'Is that mana wine? For me?$b$b<Iadreth hungrily gulps down the bottle.>$b$bYou and this Astoril have my thanks. I would surely have perished out here.' WHERE `ID` = 40469;
UPDATE `quest_offer_reward` SET `RewardText` = 'You made Mayla smile. That is the first time I have seen her smile in... ever?' WHERE `ID` = 40515;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hail, $n. I''ve got your ship assignment right here.$b$bBut first, a bit of readiness is in order!' WHERE `ID` = 40519;
UPDATE `quest_offer_reward` SET `RewardText` = 'As for myself, I''m the proprietor of this establishment. If you have any questions concerning our shop, please direct them to me.$B$BNow, onto business.
' WHERE `ID` = 40523;
UPDATE `quest_offer_reward` SET `RewardText` = 'So the ring was stolen by murlocs? Sounds like another opportunity for you and I to work together!$B$BPartners in crime, for the rest of time!
' WHERE `ID` = 40524;
UPDATE `quest_offer_reward` SET `RewardText` = 'What''s this?$B$B<Tiffany opens the bag and pulls out a jewel. She examines it and then drops it on the floor, where it shatters.>$B$BThese jewels were delivered by...$B$BWINSTON!!! That thief! How dare he switch them out for these... pathetic imitations!
' WHERE `ID` = 40530;
UPDATE `quest_offer_reward` SET `RewardText` = 'It feels good to be out of there. As promised, Jabrul will share with you some of his knowledge.$B$BWhat is it you''re most interested in learning about?
' WHERE `ID` = 40536;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope these weren''t too heavy for a small brul such as yourself to carry.$B$BBut these will be more than enough to show you a suitable design.$B$B<Jabrul begins to carve one of the jewels into a design, instructing you how it''s done as he works.>
' WHERE `ID` = 40542;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that''s quite the haul of guns! I suppose these fell off the back of a gryphon, right?$b$b<Filgo gives you a sly wink.>' WHERE `ID` = 40545;
UPDATE `quest_offer_reward` SET `RewardText` = 'An excellent piece. Now watch carefully...$B$B<Jabrul begins to carve the glass into a rather interesting shape, describing how the shape of the gem dictates its behavior.>
' WHERE `ID` = 40546;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found it?! And you made it back!$B$B$n, I came up with a line just for this occasion and just for you.$B$BHe laughs at death, he shrugs off the pain, but $n comes back again and again!
' WHERE `ID` = 40560;
UPDATE `quest_offer_reward` SET `RewardText` = 'Praise Elune and all that her light touches... Malfurion is alive.$b$bI thought I would spend the rest of my days alone, dreaming of the choices I did not make.$b$bThank you. Thank you for returning my love to me.' WHERE `ID` = 40567;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Felskorn have witnessed true strength today. $B$BThey will think twice before raising their blades to you again.' WHERE `ID` = 40568;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was a fantastic trip, $n! We really should do this kind of thing more often!$B$BNow that you have those blades I bet there''s going to be a bunch of adventures ahead!$B$BMaybe I should just stick around here a while.
' WHERE `ID` = 40570;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s strange that the Dark Riders haven''t followed us here, but I will take whatever boon I can get.$B$BI believe the key to finding the Dark Riders is here somewhere. Let us begin our search.
' WHERE `ID` = 40588;
UPDATE `quest_offer_reward` SET `RewardText` = 'This attack... even the battle on the Broken Shore... it''s only the beginning of the Legion''s campaign.$b$bIf we don''t find a way to stop them, we''re going to lose everything my father and the other leaders built.$b$bWe need the strength of the Illidari behind us.' WHERE `ID` = 40593;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done. We will make a Skyhorn out of you yet.' WHERE `ID` = 40594;
UPDATE `quest_offer_reward` SET `RewardText` = 'Otherwise an ordinary looking journal, this book hums with dark energy as you approach it.$B$BA quick scan of the writing reveals this as the journal of Ariden, and chronicles his time in Deadwind Pass. Toward the end of the journal, the writing begins to change, and the tone becomes noticeably darker. It constantly refers to "the curse" and of the endless desire to possess things of great power.$B$BOne such entry catches your eye as you glance through.
' WHERE `ID` = 40604;
UPDATE `quest_offer_reward` SET `RewardText` = 'There is definitely something wrong with this compass. $B$BIt seems to be trying to point in all directions at once.
' WHERE `ID` = 40606;
UPDATE `quest_offer_reward` SET `RewardText` = 'It looks like it worked, and the compass is pointing toward the river. $B$BCould it be..?
' WHERE `ID` = 40611;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $r. I will tend to Nighteyes'' wounds. Tell me what happened!' WHERE `ID` = 40617;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now you must begin your pursuit of the artifact. It will not be easy to obtain, but a weapon this powerful seldom is.$b$bAfter you succeed, return here to me and we shall speak at greater length. There is much for us to do!' WHERE `ID` = 40618;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today was a great blow against the Dark Riders, and a victory for the people of Duskwood. $B$BThey are in your debt, as am I.
' WHERE `ID` = 40623;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hey there, $n. What took you so long?$B$BWhile you were traveling the long way I''ve been doing some research of my own. King Phaoris offered to help us as long as we can take care of a problem for him.$B$BI''m sure you''ll be able to handle whatever it is.
' WHERE `ID` = 40633;
UPDATE `quest_offer_reward` SET `RewardText` = 'As you wish, Grand Master.
' WHERE `ID` = 40636;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent!$B$BAs your weapon grows in power you can return here and unleash its true potential.
' WHERE `ID` = 40651;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings, $ct.$b$bThe threats we face are numerous. We must act quickly.' WHERE `ID` = 40652;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, I agree. That is a good place to focus our initial efforts.$b$bAs new threats arise, I will bring them to your attention. Elune guide your path, $ct.' WHERE `ID` = 40653;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. Soon enough, the Druids of the Claw will bolster our ranks.' WHERE `ID` = 40654;
UPDATE `quest_offer_reward` SET `RewardText` = 'This weapon is truly amazing, yet much of its potential remains untapped.$B$BIf we are to end the threat of the Burning Legion once and for all we will need to fully unlock its power.
' WHERE `ID` = 40698;
UPDATE `quest_offer_reward` SET `RewardText` = 'You know, I''ve been thinking about all the fun we''ve had together. You''re great to hang around and I''m sure Uncle Chen wouldn''t mind if I stuck around since you''re a Grandmaster and all.$B$BWhat I''m trying to say is, I''d be happy to be your explorer, scout, or resident adventurer. So, what do you say?
' WHERE `ID` = 40704;
UPDATE `quest_offer_reward` SET `RewardText` = 'Can I take that as a yes?$b$bIf you are ready, I''d like to get started immediately.$b$bI know you are immensely capable, but let''s not leave anything to chance!' WHERE `ID` = 40705;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ihr habt ein beachtliches Talent für diese Art von Aufgaben an den Tag gelegt.

Es ist erfreulich, denn wir werden Euch noch mehr abverlangen müssen, wenn wir diesen Konflikt überleben wollen.' WHERE `ID` = 40710;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m sure you have many questions, but they''re just going to have to wait. We''re at war now!$B$BWe have to move quickly, but I''ll try to explain what I can.
' WHERE `ID` = 40714;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have made the right decision.$B$BLet us hope you live up to your reputation.
' WHERE `ID` = 40716;
UPDATE `quest_offer_reward` SET `RewardText` = 'Calydus sorry we not save your friends, but maybe they survive if we hurry.$B$BJagganoth torture them, yes, but he likes to keep victims alive... mostly.
' WHERE `ID` = 40729;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will see that this gets back to our friend safely. Good work.' WHERE `ID` = 40730;
UPDATE `quest_offer_reward` SET `RewardText` = 'I-I thought... they were gonna... *sniff*' WHERE `ID` = 40745;
UPDATE `quest_offer_reward` SET `RewardText` = 'Glad you could make it. Your help is sorely needed here.' WHERE `ID` = 40746;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are in rough shape, but they will suffice.' WHERE `ID` = 40747;
UPDATE `quest_offer_reward` SET `RewardText` = 'Did we... make it?' WHERE `ID` = 40748;
UPDATE `quest_offer_reward` SET `RewardText` = 'While I am programmed for gift distribution, my observations indicate that you are programmed for gift reception.$B$BShall we engage in a mutually-favorable transaction?
' WHERE `ID` = 40753;
UPDATE `quest_offer_reward` SET `RewardText` = 'Something is very wrong here.' WHERE `ID` = 40761;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, champion. $B$BAre you ready for the burden you must bear?' WHERE `ID` = 40783;
UPDATE `quest_offer_reward` SET `RewardText` = 'So I was correct, and the Scythe is your quarry.  Know that in order to retrieve it, we must do what no denizen of Duskwood has ever attempted.$B$BWe must hunt the Dark Riders.$B$BI have been tracking them for some time since my encounter with them while hunting down the Wolf Cult.  They are a blight upon these lands, and they hold no right to the artifacts they hoard.$B$BIf we wish to recover this artifact, we will need to find their lair. Fortunately, I may just have the clue we need.' WHERE `ID` = 40785;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for recovering Oculeth. He will be an invaluable asset to our cause.' WHERE `ID` = 40830;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s strange that the Dark Riders haven''t followed us here, but I will take whatever boon I can get.$B$BI believe the key to finding the Dark Riders is here somewhere. Let us begin our search.' WHERE `ID` = 40834;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today was a great blow against the Dark Riders, and a victory for the people of Duskwood. $B$BThey are in your debt, as am I.' WHERE `ID` = 40838;
UPDATE `quest_offer_reward` SET `RewardText` = 'How did you get your hands on this?!$b$b<Didi begins inspecting the husk.>$b$bDo you realize what we could do with something like this? Our own personal fel reaver?!$b$bWe could lay waste to our enemies!$b$bWe could advance our knowledge of science and technology!$b$bWe could make it serve us drinks!' WHERE `ID` = 40854;
UPDATE `quest_offer_reward` SET `RewardText` = 'Just wat are ye and Didi puttin'' together exactly?$b$bIs it big? Dangerous? Rer-diculous?$b$bI want in!' WHERE `ID` = 40856;
UPDATE `quest_offer_reward` SET `RewardText` = 'What''d I tell ya? Now THAT''s usin'' yer HEAD!$b$bYeh see what I did there?$b$bSeeing as ''ow yeh tested them out fer me, I''ll let yeh ''ave a copy of the blueprint fer ''em.' WHERE `ID` = 40859;
UPDATE `quest_offer_reward` SET `RewardText` = 'Quite tha weed killer, eh? Haha!$B$BI figure ye''ll be wantin'' more of them charges so I went ahead an'' wrote down tha schematic fer ye.$B$BI figure it''s always good ta keep them plants an'' trees in line when they get all uppity.
' WHERE `ID` = 40862;
UPDATE `quest_offer_reward` SET `RewardText` = 'We did it! That''s one fully functional, killer-lookin'' fel reaver.$b$bShould it ever run out of power, here''s the schematic for that battery I came up with.$b$bJust pop a new one in it and you should be good to go.$b$bBy the way, whatcha think we should name it? I was thinking somethin'' deadly, like "Reaves."' WHERE `ID` = 40863;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh aye, tha''s plenty, lad. I made sum adjustments ta tha design fer tha gunpack.$B$BYou should probably hold on to ''em, seein as ''ow these inventions of Hobart keep explodin'' on me.
' WHERE `ID` = 40873;
UPDATE `quest_offer_reward` SET `RewardText` = 'I thought the Moon Guard could endure anything...' WHERE `ID` = 40883;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see that you have returned with the freshly carved remains of the fel basilisks.$b$bListen closely, and I will explain the purpose behind retrieving them...' WHERE `ID` = 40898;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Scythe of Elune!$b$bI never thought I would see that weapon used without turning its wielder into a savage beast, but you''ve brought balance to its primal nature.$b$bElune has certainly guided your hand, $n. You''ve accomplished what no druid has done before!' WHERE `ID` = 40900;
UPDATE `quest_offer_reward` SET `RewardText` = 'Grimwing was a formidable demon... I must say I am impressed with your skill, $n.$b$bThere are many more demons here to kill. It is good to have someone capable at my side.' WHERE `ID` = 40901;
UPDATE `quest_offer_reward` SET `RewardText` = 'With my adversaries gone, I can claim leadership of Jandvik unopposed.' WHERE `ID` = 40907;
UPDATE `quest_offer_reward` SET `RewardText` = 'I do not know who you are, but I must thank you.' WHERE `ID` = 40927;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see you have returned with the emblems. Excellent.$b$bLet''s see how this wyrmtongue reacts when we show him what we''ve made of his comrades.' WHERE `ID` = 40929;
UPDATE `quest_offer_reward` SET `RewardText` = 'As much as your company pains me, you are proving to be a powerful ally. $B$BI believe the key to finding the Dark Riders is here somewhere. It is strange that the riders haven''t followed us here, but we should make haste lest they change their mind.
' WHERE `ID` = 40931;
UPDATE `quest_offer_reward` SET `RewardText` = 'The chill down my spine tells me that you must have met with success.$B$BWhat did you find?
' WHERE `ID` = 40933;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today was a great blow against the Dark Riders, and a victory for the people of Duskwood. $B$BThey are in your debt, as am I.
' WHERE `ID` = 40934;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, Cardinal. I think you''ll find we''ve done quite a job getting this place prepared for you. We should get started immediately.' WHERE `ID` = 40938;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. I feel better knowing they will not continue to sacrifice themselves for us.' WHERE `ID` = 40949;
UPDATE `quest_offer_reward` SET `RewardText` = 'There is much to do, noble $C. But first, I suppose you''ll want to learn a little more about who I am and why I have sought you out.
' WHERE `ID` = 40952;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve observed your skills for some time, $n. Watched you from a distance.$B$B$B$BWait, that sounds a little creepy. Sorry, my social skills are a tad rusty. Let me start again.$B$BOur order has been on the lookout for hunters who could lead the Unseen Path into a new era. No one is more qualified for that role than you.
' WHERE `ID` = 40953;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion has returned, and the Unseen Path needs new blood... new leadership.$B$BThe weapon you hold is proof there is no one better suited to this task.$B$BWill you take up the mantle? Will you fulfill the oath my order took so long ago?
' WHERE `ID` = 40954;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hail, Pathfinder! It will be my honor to aid you in the fight against the Legion.
' WHERE `ID` = 40958;
UPDATE `quest_offer_reward` SET `RewardText` = 'She''s a BEAUTY! I''ve never seen the like!$B$BYeah yeah, sure, throw ''er in that fountain. Light knows people throw all sorts of other junk in there.$B$B<The pearl glows brighter now, and moves to a spot above the water.>
' WHERE `ID` = 40961;
UPDATE `quest_offer_reward` SET `RewardText` = 'I heard screams, and I was gratified that they belonged to the Nightborne. Well done.' WHERE `ID` = 40963;
UPDATE `quest_offer_reward` SET `RewardText` = 'Serena sent you? Good... she still lives.' WHERE `ID` = 40964;
UPDATE `quest_offer_reward` SET `RewardText` = 'A lesson we all must one day learn. Never assume your enemy dead until you see their corpse. <Lothrius grins.>' WHERE `ID` = 40965;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank the Mother Moon... They survived!' WHERE `ID` = 40967;
UPDATE `quest_offer_reward` SET `RewardText` = 'Lothrius and Thalrenus live, then. There may be some hope yet. Thank you for braving the bridge, stranger.' WHERE `ID` = 40969;
UPDATE `quest_offer_reward` SET `RewardText` = 'They had no right to this power. Thank you.' WHERE `ID` = 40970;
UPDATE `quest_offer_reward` SET `RewardText` = 'I called them here. I will see that they are taken care of after the horrors my people put them through.' WHERE `ID` = 40972;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are truly amazing, Master $n.$b$bNow, let''s get to work, shall we?' WHERE `ID` = 40990;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve done it! With this technique, we should be able to prepare dried mackerel strips much more efficiently.$b$bI am certain that there is much more we can learn. Keep bringing me ingredients, and I will keep the oven on!' WHERE `ID` = 40991;
UPDATE `quest_offer_reward` SET `RewardText` = 'We may have finally overcome this naga threat.' WHERE `ID` = 41001;
UPDATE `quest_offer_reward` SET `RewardText` = 'Incredible. The very staff the Emperor used to cloak Pandaria in mists all those ages ago!$B$BTreat that staff well, $n. It will save your life. And probably the lives of all your friends, as well...
' WHERE `ID` = 41003;
UPDATE `quest_offer_reward` SET `RewardText` = 'There is much to do, noble $C. But first, I suppose you''ll want to learn a little more about who I am and why I have sought you out.
' WHERE `ID` = 41009;
UPDATE `quest_offer_reward` SET `RewardText` = 'What in the world have you brought me?! Nat told you to ask me to turn THIS into a pole?$B$B<Marcia takes the severed lure from you. As she holds it close to the pearl, it begins to resonate with it.>$B$BThat''s interesting. There seems to be a connection between this and the pearl. Maybe turning this into a fishing rod can yield some interesting results...
' WHERE `ID` = 41010;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well ain''t that nice an'' shiny!$B$BYou''ll need ta get used to usin'' that thing. Then we can mess with it rather than, ye know, puttin'' it in a museum and respectin'' it for the piece o'' history that it is.$B$B You should head back to Alonsus, he''s giving us the eye.
' WHERE `ID` = 41017;
UPDATE `quest_offer_reward` SET `RewardText` = 'An excellent choice! We will do our best to support your efforts on the Broken Isles.' WHERE `ID` = 41019;
UPDATE `quest_offer_reward` SET `RewardText` = 'I must admit I am impressed. You may actually be of some use to us.' WHERE `ID` = 41028;
UPDATE `quest_offer_reward` SET `RewardText` = 'There are sea giants in the bay!?$B$BYou must tell Toryl about this grave news right away.' WHERE `ID` = 41034;
UPDATE `quest_offer_reward` SET `RewardText` = 'I was a fool. I thought that I could banish Kathra''natir once and for all, but instead the dreadlord broke free.$B$BIn the years he spent trapped within my body, he must have been privy to my secrets... such as those of the Council of Tirisfal.$b$bThe damage he could do with this knowledge is unthinkable. He must be stopped.' WHERE `ID` = 41035;
UPDATE `quest_offer_reward` SET `RewardText` = 'My master was loved by many, and she passed her knowledge to me.$B$BHowever, the recipe for Storm Brew, her most fiercely guarded secret, was stolen before she could teach it to me.
' WHERE `ID` = 41038;
UPDATE `quest_offer_reward` SET `RewardText` = 'The last time I saw these notes, I was still a young child.$B$BI understand much of what is written here now.$B$BIt won''t be easy to acquire everything here, but I believe we can do it, $n.
' WHERE `ID` = 41039;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hello, champion.$B$BI have been watching you from afar.
' WHERE `ID` = 41040;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wondrous! The growing power of your artifact will strike fear into the hearts of the demon army!
' WHERE `ID` = 41047;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings, $n. It will be my honor to assist you with your artifact.
' WHERE `ID` = 41053;
UPDATE `quest_offer_reward` SET `RewardText` = 'I pray it is not too late, friend.' WHERE `ID` = 41056;
UPDATE `quest_offer_reward` SET `RewardText` = 'Tell me, were the Halls of Valor as amazing as the stories say? Regardless, you got the cauldron. Now we can begin brewing.
' WHERE `ID` = 41059;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a wise choice. $B$BIt should serve you well in our hunt for Kathra''natir.' WHERE `ID` = 41085;
UPDATE `quest_offer_reward` SET `RewardText` = 'Astounding, Grandmaster! Reports are flying in about your success. Without your help, many of our outposts around the Broken Isles would have fallen.
' WHERE `ID` = 41086;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t know about you, Grandmaster, but I think we should take a well-earned rest after all of this.
' WHERE `ID` = 41087;
UPDATE `quest_offer_reward` SET `RewardText` = 'A mighty blade! Forged by the son of vrykul, enchanted by elven sorcery, and quenched in the blood of a C''thraxxi. It will serve you well, $n. With it, you will put an end to our enemies!
' WHERE `ID` = 41105;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your eyes are opening to our reality. I can see it in your expression. Good.' WHERE `ID` = 41148;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is... not a weapon of Huln''s. From the looks of it, I believe this to be the Spear of Rethu, an ancient tauren miner.$B$BI have no interest in this artifact, $n. You may have it.
' WHERE `ID` = 41188;
UPDATE `quest_offer_reward` SET `RewardText` = 'They look so happy to be home. Excellent work.' WHERE `ID` = 41197;
UPDATE `quest_offer_reward` SET `RewardText` = 'As I suspected, the Illidari are holding the line against the Burning Legion, but just barely.

We must come to their aid, $n.' WHERE `ID` = 41220;
UPDATE `quest_offer_reward` SET `RewardText` = 'These devices are peculiar. They are like the traps our hunters use, but can magically attract and trap nearby beasts.' WHERE `ID` = 41230;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. There''s no time to waste.' WHERE `ID` = 41255;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R fisherman. The Valarjar thank you for bringing these stormrays.
' WHERE `ID` = 41277;
UPDATE `quest_offer_reward` SET `RewardText` = 'You couldn''t have arrived at a better time, $C. Our people were running short on supplies.
' WHERE `ID` = 41303;
UPDATE `quest_offer_reward` SET `RewardText` = 'You couldn''t have arrived at a better time, miner. Our people were running short on supplies.
' WHERE `ID` = 41314;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hail, $C. I can take this leystone off of your hands. Your gift will be put to good use.
' WHERE `ID` = 41316;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R $C. The Valarjar thank you for bringing this leystone.
' WHERE `ID` = 41317;
UPDATE `quest_offer_reward` SET `RewardText` = 'You couldn''t have arrived at a better time, $C. Our people were running short on supplies.
' WHERE `ID` = 41318;
UPDATE `quest_offer_reward` SET `RewardText` = 'Congratulations, $ct $n.$b$bWe will be counting on you in the days ahead.' WHERE `ID` = 41332;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R skinner. The Valarjar thank you for bringing these stormscales.
' WHERE `ID` = 41344;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R $C. The Valarjar thank you for bringing these stormscales.
' WHERE `ID` = 41345;
UPDATE `quest_offer_reward` SET `RewardText` = 'You couldn''t have arrived at a better time, $C. Our people were running short on supplies.
' WHERE `ID` = 41351;
UPDATE `quest_offer_reward` SET `RewardText` = 'Any of the three weapons you learned of would be a huge boon in the war against the Legion.$b$bBut your crusade must start with one of them, so you must choose.' WHERE `ID` = 41415;
UPDATE `quest_offer_reward` SET `RewardText` = 'I must express gratitude for the vrykul you have saved this day.' WHERE `ID` = 41426;
UPDATE `quest_offer_reward` SET `RewardText` = 'Delving into the Dream with such darkness encroaching is no simple task, one few druids dare attempt, but I''m afraid your journey is far from over.
' WHERE `ID` = 41436;
UPDATE `quest_offer_reward` SET `RewardText` = 'My preparations are complete. Are you prepared to enter the Dream?
' WHERE `ID` = 41449;
UPDATE `quest_offer_reward` SET `RewardText` = 'All is in its proper place. We are that much closer to being settled.' WHERE `ID` = 41452;
UPDATE `quest_offer_reward` SET `RewardText` = 'How good of Mayruna to send help. I had nearly lost hope.' WHERE `ID` = 41463;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am relieved, though there remains more we must do.' WHERE `ID` = 41464;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ahh, see! I told you it would not tarnish. Now there''s nothing linking me to that fool...$b$bWhat''s that? A plot to weaken his position? Regardless, the damage has been done. Better safe than sorry.' WHERE `ID` = 41465;
UPDATE `quest_offer_reward` SET `RewardText` = 'What a disturbing tale!' WHERE `ID` = 41467;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back. I see we are ready to begin.' WHERE `ID` = 41469;
UPDATE `quest_offer_reward` SET `RewardText` = 'This fine gentleman was just telling me how dearly he loves his forest. Let us assist him!' WHERE `ID` = 41473;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome, $r.' WHERE `ID` = 41478;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $r.' WHERE `ID` = 41479;
UPDATE `quest_offer_reward` SET `RewardText` = 'Such a gluttonous creature.' WHERE `ID` = 41480;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am much relieved, $n.' WHERE `ID` = 41485;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your assistance made this all possible. Thank you.' WHERE `ID` = 41494;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t know the full details, but a demon prisoner has given us the first solid lead on Alleria Windrunner''s whereabouts in a very long time.$B$BThe ranger-general has joined with members of the Farstriders on the Broken Shore. She''s putting a team together, and your presence is crucial to its success.
' WHERE `ID` = 41540;
UPDATE `quest_offer_reward` SET `RewardText` = 'You might feel a bit dizzy after going through that teleporter. The Broken Isles isn''t exactly next door, after all.
' WHERE `ID` = 41574;
UPDATE `quest_offer_reward` SET `RewardText` = 'I do not know who you are, but you are not a sea giant, and that is enough for me.' WHERE `ID` = 41606;
UPDATE `quest_offer_reward` SET `RewardText` = 'They are alive? That is good news. Their knowledge of the defenses will be invaluable.
' WHERE `ID` = 41607;
UPDATE `quest_offer_reward` SET `RewardText` = 'I only wish that I had the chance to get to him first.$B$BBah! His body can rot in these waters for all I care.' WHERE `ID` = 41618;
UPDATE `quest_offer_reward` SET `RewardText` = 'So you seek Light''s Wrath? A dangerous weapon, to be sure.$B$BLong ago the Kirin Tor entrusted its safekeeping to the blue dragonflight. It was locked away in the only place that could contain its rampant power - the Nexus Vault.$B$BI have not been there in some time, however. After the blue dragonflight was dissolved, the Nexus was abandoned. There is no knowing whether the Nexus Vault is still intact - or what may be waiting in the Nexus itself.
' WHERE `ID` = 41625;
UPDATE `quest_offer_reward` SET `RewardText` = 'This appears to be a communication device commonly utilized by the ethereals.$B$BPerhaps it could be the key to finding out who is behind the happenings at the Dragonshrine.
' WHERE `ID` = 41626;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have my gratitude for saving Azuregos, $n. I can rest easy knowing that the Nexus is under his care.$B$BAs for you, I can see you''re full of surprises. Never in my time have I seen a $C who can control the chaotic energies of Light''s Wrath. $B$BYou are truly the hero we need to face the Legion.
' WHERE `ID` = 41631;
UPDATE `quest_offer_reward` SET `RewardText` = 'So the dragons proved helpful? This is good, we may need their assistance in the war to come.
' WHERE `ID` = 41632;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R leatherworker. The Valarjar thank you for bringing these boots.
' WHERE `ID` = 41642;
UPDATE `quest_offer_reward` SET `RewardText` = 'You couldn''t have arrived at a better time, leatherworker. Our people were running short on supplies.
' WHERE `ID` = 41643;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Kirin Tor thank you.
' WHERE `ID` = 41644;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R tailor. The Valarjar thank you for bringing these bracers.
' WHERE `ID` = 41648;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Kirin Tor thank you.
' WHERE `ID` = 41650;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R jewelcrafter. The Valarjar thank you for bringing this ring.
' WHERE `ID` = 41654;
UPDATE `quest_offer_reward` SET `RewardText` = 'You couldn''t have arrived at a better time, jewelcrafter. Our people were running short on supplies.
' WHERE `ID` = 41655;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Kirin Tor thank you.
' WHERE `ID` = 41656;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, alchemist. We needed these potions badly.
' WHERE `ID` = 41657;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hail, alchemist. I can take these elixirs off of your hands. Your gift will be put to good use.
' WHERE `ID` = 41658;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R alchemist. The Valarjar thank you for bringing these potions.
' WHERE `ID` = 41660;
UPDATE `quest_offer_reward` SET `RewardText` = 'You couldn''t have arrived at a better time, alchemist. Our people were running short on supplies.
' WHERE `ID` = 41661;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Kirin Tor thank you.
' WHERE `ID` = 41662;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, scribe. We needed these supplies badly.
' WHERE `ID` = 41663;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hail, scribe. I can take these supplies off of your hands. Your gift will be put to good use.
' WHERE `ID` = 41664;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R scribe. The Valarjar thank you for bringing these supplies.
' WHERE `ID` = 41666;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Kirin Tor thank you.
' WHERE `ID` = 41668;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hail, enchanter. I can take this enchantment off of your hands. Your gift will be put to good use.
' WHERE `ID` = 41670;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R enchanter. The Valarjar thank you for bringing this enchantment.
' WHERE `ID` = 41672;
UPDATE `quest_offer_reward` SET `RewardText` = 'You couldn''t have arrived at a better time, enchanter. Our people were running short on supplies.
' WHERE `ID` = 41673;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Kirin Tor thank you.
' WHERE `ID` = 41674;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $R engineer. The Valarjar thank you for bringing this gunpack.
' WHERE `ID` = 41678;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Kirin Tor thank you.
' WHERE `ID` = 41680;
UPDATE `quest_offer_reward` SET `RewardText` = 'We all owe you a great deal for your heroism, $n. I owe you a great deal.$B$BI suspect this war is far from over.
' WHERE `ID` = 41689;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t know how much longer I would have lasted had you not arrived - thank you.
' WHERE `ID` = 41690;
UPDATE `quest_offer_reward` SET `RewardText` = 'So, Kel''danath turned in the end...$B$BHe deserved better. Thank you for giving him peace.' WHERE `ID` = 41704;
UPDATE `quest_offer_reward` SET `RewardText` = 'He is still alive, but the rest remains to be seen.' WHERE `ID` = 41708;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have all the parts that you will need... two in some cases.' WHERE `ID` = 41709;
UPDATE `quest_offer_reward` SET `RewardText` = 'No one is safe from this corruption.' WHERE `ID` = 41724;
UPDATE `quest_offer_reward` SET `RewardText` = 'I did not expect the Grandmaster himself! Your strength will help us turn the tide. We cannot let these demons succeed!
' WHERE `ID` = 41728;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good wicket, strong wicket, thanks for helping! You''ve sent the demons off, groaning and yelping!
' WHERE `ID` = 41730;
UPDATE `quest_offer_reward` SET `RewardText` = 'The grounds are safe, thanks to you... too bad we couldn''t save any of that brew!$B$B<The Monkey King heaves a great sigh.>
' WHERE `ID` = 41731;
UPDATE `quest_offer_reward` SET `RewardText` = 'Tian Monastery is safe again, thanks to you.
' WHERE `ID` = 41732;
UPDATE `quest_offer_reward` SET `RewardText` = 'Clever $R, we fought as one, to defend the temple of the rising sun.$B$BA natural leader, you laid enemies low, I''d much rather be your friend than foe!$B$BInto the ring, my hat I toss! Let me fight with you, new boss!
' WHERE `ID` = 41735;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ahhh, it feels good to be back out of harm''s way.$B$BNow dat I''ve got a couple brews in me, I feel much better.$B$BI owe you my life, Grandmaster. You have my undying loyalty. Just say da word, and I will do whatever you ask of me.
' WHERE `ID` = 41737;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have been through quite a lot together, $n.$B$BWithout your help, I could not have avenged my master, nor found the courage to make her legendary brew.$B$BThanks to you, we should have plenty of Storm Brew to supply the entire temple.$B$BSpeaking of which, I feel there are many similarities between your fighting style and mine.$B$BWould you accept me as the newest member of your order?
' WHERE `ID` = 41739;
UPDATE `quest_offer_reward` SET `RewardText` = 'The scouting mission was more successful than we could have imagined, $n. Your troops were able to rescue Journeyman Goldmine, a... most unusual little $C.$B$BIn thanks, he has agreed to lend his skill to our cause.
' WHERE `ID` = 41741;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have always respected you for your courage in battle, Farseer.$B$BHowever, the way you have championed the Earthen Ring and united the Elemental Lords... it has been an honor to behold. You truly are a great leader. The leader our order needs!$B$BThough the elements are united against the Burning Legion, our work is not yet done. If you should have need of my abilities, you need only ask.$B$BI live to serve the Earthen Ring!
' WHERE `ID` = 41744;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Firelord has commanded me to aid the mortals in their battle against the Burning Legion.$B$BMy master has decreed that demon invaders have no place upon this world. I live to destroy the enemies of my master.$B$BI will obey your commands as though they are the Firelord''s himself. Who shall I destroy first?
' WHERE `ID` = 41745;
UPDATE `quest_offer_reward` SET `RewardText` = 'Rebuilding the council is our key to defeating the Legion, but it''s a task that cannot be completed alone.$B$BYou could use someone at your side, someone who''s familiar with the burden of leadership.$B$BI would be honored to serve as Second. Through your power and guidance, we can rebuild.
' WHERE `ID` = 41748;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your commitment to rebuilding the council is commendable. You could have left Shinfel to die and found a replacement, but you look out for your own.$B$BI followed blindly once before, trusting my mentor to look out for my best interests. Instead, he left me to lead a council that admonished my way of doing things.$B$BFor this, I will never be a follower. Instead, I choose to stand beside you. My power is yours to use as you see fit, if you wish to use it.
' WHERE `ID` = 41751;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have to stop meeting like this, $n. You''ve saved me more times than I care to admit.$B$BIf you in turn ever need saving, I''ll be there to return the favor.
' WHERE `ID` = 41753;
UPDATE `quest_offer_reward` SET `RewardText` = 'So Ritssyn appointed you First of our council, did he?$B$BIt seems much has changed in the short time I''ve been gone.$B$BThe Legion threat is greater than ever. I have witnessed their power firsthand, and know that we cannot defeat them as we are now.$B$BYou will unite us, $n, and together we will strip the Legion of their power!
' WHERE `ID` = 41754;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t have to hide away in shame anymore, and I have you to thank for that.$B$BIt''s a debt I doubt I''ll ever be able to repay, but I''d like to try.
' WHERE `ID` = 41755;
UPDATE `quest_offer_reward` SET `RewardText` = 'We live to serve you, $n.$B$BIt would please us to do your bidding.
' WHERE `ID` = 41756;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ritssyn sent you, did he? I see my old mentor still refuses to do his own dirty work.$B$BBut of course, someone in his position can''t be seen consorting with a purported member of the Argus Wake! What would the others think?$B$BAs much as I relish the idea of Ritssyn needing my help, I don''t barter in kindness and favors, $n.$B$BMy currency is power and knowledge. If you have either, then it''s possible we can come to an arrangement.
' WHERE `ID` = 41759;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fascinating.$B$BLet us hope the spell holds.' WHERE `ID` = 41760;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am pleased you were able to place the first ward. We are one step closer to saving Ebonhorn.$B$BBut this mention of the Darkness is unsettling. It is a monster spoken of in our myths and folklore, tales told around campfires to spook the young.$B$BCould these stories be based in truth?
' WHERE `ID` = 41764;
UPDATE `quest_offer_reward` SET `RewardText` = 'Shinfel cannot be broken at the hands of Mephistroth. Armed with her power and knowledge, the dreadlord would be able to mount a devastating attack against Dreadscar Rift.$B$BA ritual of summoning should be able to summon Shinfel to our side, but we''ll need to create a powerful anchor.
' WHERE `ID` = 41767;
UPDATE `quest_offer_reward` SET `RewardText` = 'We may have Shinfel in our possession, but her mind remains in the hands of her demon captors.$B$BWhat kind of ancient magic have they cursed her with? I''ve never seen anything like it.
' WHERE `ID` = 41768;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s a name I thought I''d never hear again.$B$BWe may have worked together in the past, but Ritssyn needs to know I''m not the man I was before.$B$BMy priorities are Marl and this farm.
' WHERE `ID` = 41769;
UPDATE `quest_offer_reward` SET `RewardText` = 'Farseer Nobundo has told me of your plan to save Azeroth. I fear I may be the only zephyr to share your desire.
' WHERE `ID` = 41770;
UPDATE `quest_offer_reward` SET `RewardText` = 'At long last, the Windseeker shall return to to his rightful place as heir to the Throne of Four Winds. This is a glorious day for Skywall!
' WHERE `ID` = 41771;
UPDATE `quest_offer_reward` SET `RewardText` = 'At last you have arrived, Farseer $n.$B$BIt seems our presence in the Firelands has not gone unnoticed.
' WHERE `ID` = 41772;
UPDATE `quest_offer_reward` SET `RewardText` = 'The son of Rhyolith slain by mere mortals? What an ignominious death!$B$BYou have done well, $C. This pleases me greatly.
' WHERE `ID` = 41773;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Earthen Ring has come to offer help? This is unexpected... but welcome, nonetheless.
' WHERE `ID` = 41775;
UPDATE `quest_offer_reward` SET `RewardText` = 'At long last, I have returned to Skywall thanks to the help of mortal hands. I owe you a great debt, Farseer.
' WHERE `ID` = 41776;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Twilight''s Hammer will not soon recover from the damage we''ve dealt to their numbers this day. It is an honor to battle at your side, Farseer $n.
' WHERE `ID` = 41777;
UPDATE `quest_offer_reward` SET `RewardText` = 'Success! While their interior decoration sensibilities may differ significantly from those of Dalaran''s architects, the demon hunters do make an efficient forge.$b$bYou keep the obliterum, $n. I have a feeling you''ll be needing it eventually.' WHERE `ID` = 41778;
UPDATE `quest_offer_reward` SET `RewardText` = 'This looks like everything I need. Just give me a moment to mix it all together.
' WHERE `ID` = 41780;
UPDATE `quest_offer_reward` SET `RewardText` = 'Killing a demon isn''t always the answer. Sometimes, the solution is to control one, or two as the case may be.$B$BIf we can summon the sisters and bend their will to ours, it will deliver a devastating blow to Mephistroth''s forces and rid Shinfel of her curse.
' WHERE `ID` = 41784;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.$B$BYour willingness to help an outcast will not be forgotten.
' WHERE `ID` = 41787;
UPDATE `quest_offer_reward` SET `RewardText` = 'This writing is a bit difficult to decipher, but I think all the pertinent information is included.$B$BArmed with this confession, I should be able to prove my innocence and focus on more pressing matters.
' WHERE `ID` = 41788;
UPDATE `quest_offer_reward` SET `RewardText` = 'With Lulubelle''s assistance, we should be able to complete the summoning.
' WHERE `ID` = 41793;
UPDATE `quest_offer_reward` SET `RewardText` = 'You did it, $n. The demon twins are under your control.$B$BI have not witnessed such power since the fall of Ragnaros.
' WHERE `ID` = 41795;
UPDATE `quest_offer_reward` SET `RewardText` = 'And so the choice is made.
' WHERE `ID` = 41796;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. These troops will be invaluable in our defense of the Broken Isles. Deploy them on missions, just as you would with our champions.
' WHERE `ID` = 41797;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m here to help build you an army, $n.
' WHERE `ID` = 41798;
UPDATE `quest_offer_reward` SET `RewardText` = 'These shadows of the spirit realm grow stronger. I fear they may soon pierce the veil into our reality.$B$BI pray restoring the wards will set things right.
' WHERE `ID` = 41799;
UPDATE `quest_offer_reward` SET `RewardText` = 'Huln battled the Necrodark?$B$BThere are so many tall tales attributed to Huln that I assumed those drogbar to be just another story. But it is clear they served the Darkness.$B$BA troubling discovery... but there is no time to dwell on it now.
' WHERE `ID` = 41800;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mayla charged ahead with Ebonhorn. Now they''re cut off from the rest of us.$B$BThis is bad, $n.
' WHERE `ID` = 41815;
UPDATE `quest_offer_reward` SET `RewardText` = 'That mask suits you.$B$BIn Suramar, it can be quite advantageous to be someone else for a time...' WHERE `ID` = 41834;
UPDATE `quest_offer_reward` SET `RewardText` = 'Perfect timing, $n. These shards will prove very useful in what I''m about to do.
' WHERE `ID` = 41840;
UPDATE `quest_offer_reward` SET `RewardText` = 'We failed! The ward is shattered.$B$BI sense the Darkness rising...
' WHERE `ID` = 41841;
UPDATE `quest_offer_reward` SET `RewardText` = 'They made you Grandmaster, eh? Well, I was busy anyway!$B$BAnyway, I managed to escape from those fel-drinking dirt-kickers across the road, but our own are still in trouble.$B$BThose Legion worms are goin'' ta sacrifice the prisoners for their souls.$B$BWe''ve got ta help them!
' WHERE `ID` = 41849;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, Grandmaster!$B$BThat should be all of them.
' WHERE `ID` = 41852;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is fantastic news, $n!$B$BNot only have you disrupted the Legion''s plans, but you''ve saved the lives of numerous people.$B$BIn addition, you rescued three of the greatest monks we''ve trained in recent history.$B$BThe order is indebted to you once again.
' WHERE `ID` = 41854;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope you have prepared yourself to enter the City. It is time.' WHERE `ID` = 41877;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let''s get started, shall we?' WHERE `ID` = 41878;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n. If left unchecked, the whispers can turn even the best of friends against one another.
' WHERE `ID` = 41882;
UPDATE `quest_offer_reward` SET `RewardText` = 'I did not think that I would live to see the day when the four great Elemental Lords would unite with the mortal races of Azeroth.$B$BYou have done what no other Farseer has done in the history of the Earthen Ring.$B$BThis is truly a day that will be remembered for generations!
' WHERE `ID` = 41888;
UPDATE `quest_offer_reward` SET `RewardText` = 'Is there anything we can''t do? I''m starting to think not!$B$BI''ll make sure this barding gets to Mei. You hold on to the pattern and maybe you can make some profit with it.
' WHERE `ID` = 41889;
UPDATE `quest_offer_reward` SET `RewardText` = 'The servants of Therazane are free and the dark rituals of subjugation have been halted... for now.
' WHERE `ID` = 41898;
UPDATE `quest_offer_reward` SET `RewardText` = 'The captives have been set free, but there is still much more to be done if we are to dismantle the Twilight''s Hammer cult...
' WHERE `ID` = 41899;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to see you safely back, Farseer. With Therazane''s allegiance, we now have three of the Elemental Lords united to our cause.$B$BHowever, one still remains...
' WHERE `ID` = 41900;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your champion moved swiftly, $n! This report clearly indicates that Tian Monastery is under attack!
' WHERE `ID` = 41905;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. It will be extremely dangerous to infiltrate the Gates, but with this information, we will know exactly the enemy''s location and numbers.
' WHERE `ID` = 41909;
UPDATE `quest_offer_reward` SET `RewardText` = 'This water is filtered from only the freshest fallen snow every winter, and is a vital ingredient to our brew!
' WHERE `ID` = 41910;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well well, looks like that old fool finally met his match?$b$bIt looks like the Promenade is in need of a new jeweler, and I think I have learned all I could from my former master.$b$bHere is something for your efforts.' WHERE `ID` = 41915;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our strength grows and our enemies wane. We will win this fight, $n!' WHERE `ID` = 41916;
UPDATE `quest_offer_reward` SET `RewardText` = 'Most excellent, Grandmaster! The mission was a success. Our new teacher, Recruiter Tianji, is getting situated as we speak.
' WHERE `ID` = 41945;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. These troops will be invaluable in our defense of the Broken Isles. Deploy them on missions, just as you would with our champions.
' WHERE `ID` = 41946;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for arriving in such haste, $gBrother:Sister;.' WHERE `ID` = 41957;
UPDATE `quest_offer_reward` SET `RewardText` = 'I... I owe you my life, brother, but that look on your face tells me you''re here for something else.$B$B<You tell Barrem about his mentioning of T''uure in his sleep.>$B$BI must have been dreaming of Alora, she was my cell mate in that accursed world the demons took me to. She told me she saw the crystal but never said much else.$B$BI just hope she is still alive.
' WHERE `ID` = 41966;
UPDATE `quest_offer_reward` SET `RewardText` = 'I felt my soul being ripped from my body. If you hadn''t come when you did... I don''t even want to think about it!$B$BIs there anything I can do to repay you? I owe you my life after all.$B$B<You mention to her Barrem''s story.>$B$BBarrem still lives too? Oh thank the light! Yes, I''ll gladly tell you everything I know.
' WHERE `ID` = 41967;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. Now our work can begin.' WHERE `ID` = 41989;
UPDATE `quest_offer_reward` SET `RewardText` = 'You seek a demon with a staff of crystal? The Eredar that calls itself Lady Calindris has one that matches your description perfectly.$B$BShe''s MY prey though! I''ve been chasing her minion all over the isles and I''m not about to let this opportunity pass.$B$BI could use someone to watch my back though. If you help me out I''d be willing to let you take this staff you seek. I don''t care about her equipment, it''s her soul that I''m after.$B$BWell, what do you say?
' WHERE `ID` = 41993;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m glad yer coming. I''ve been wanting to pursue this for some time now. With help from the Seers, I think it can be done!' WHERE `ID` = 42000;
UPDATE `quest_offer_reward` SET `RewardText` = 'So you seek Aluneth? A dangerous weapon, to be sure.

Long ago the Kirin Tor entrusted the blue dragonflight with its safekeeping. It was locked away in the only place that could contain its rampant power  - the Nexus Vault.

I have not been there in some time, however. After the blue dragonflight was dissolved, the Nexus was all but abandoned. There is no knowing whether the Nexus Vault is still intact - or what may be waiting in the Nexus itself.' WHERE `ID` = 42001;
UPDATE `quest_offer_reward` SET `RewardText` = 'I trust the journey wasn''t too long or hard.$b$bLet''s go find our dead adventurer, eh?' WHERE `ID` = 42002;
UPDATE `quest_offer_reward` SET `RewardText` = 'I think I already have a lead on that island. Word around the tavern was a great warrior had broken into a vrykul king''s tomb on an island in Stormheim.$b$bThat''s got to be the one we''re looking for!' WHERE `ID` = 42005;
UPDATE `quest_offer_reward` SET `RewardText` = 'This appears to be a communication device commonly utilized by the ethereals.$B$BPerhaps it could be the key to finding out who is behind the happenings at the Dragonshrine.' WHERE `ID` = 42006;
UPDATE `quest_offer_reward` SET `RewardText` = 'It seems that the Ethereum has gleaned how to use Malygos''s surge needles to bore deeper into the Twisting Nether.$B$BI believe we might be able to use these devices against them.' WHERE `ID` = 42008;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see you are able to harness the energies of Aluneth. It has been a long time since there was a $c that could control it.

Now, are you prepared to unleash it?' WHERE `ID` = 42009;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have my gratitude for saving Azuregos, $n. I can rest easy knowing that the Nexus is under his care.$B$BAs for you, I can see you''re full of surprises. Never in my time have I seen a mage who can control the chaotic energies of Aluneth. $B$BThank you for what you have done for me and my kind today. You are truly the hero we need to face the Legion.' WHERE `ID` = 42011;
UPDATE `quest_offer_reward` SET `RewardText` = 'You were just with Naralex? What were the results of the sampling?' WHERE `ID` = 42031;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our champions returned from Shaladrassil just moments ago, Archdruid. The journey was a great success!' WHERE `ID` = 42032;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m glad you are here, $n, but if only we had arrived earlier! This place was in chaos when I arrived.$B$BThe survivors claim they were attacked by satyr, but how can this be? No satyrs have roamed these woods since ancient times.' WHERE `ID` = 42033;
UPDATE `quest_offer_reward` SET `RewardText` = 'The satyr have never been this bold, or powerful. They took us completely by surprise, and our magic could not withstand their attacks. Without you, I would not have survived.$B$BI have only one purpose now - to recover that idol.' WHERE `ID` = 42034;
UPDATE `quest_offer_reward` SET `RewardText` = 'Look what we dragged in.' WHERE `ID` = 42035;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Idol... so relieved am I to see it in your hands, $n.$B$BWe will keep it here at the Dreamgrove for safekeeping.' WHERE `ID` = 42036;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, the druids have gathered. Even now, they should be flocking to Nordrassil to prepare for the ritual.' WHERE `ID` = 42037;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have seen enough of the Nightmare to know that it is not an idle threat. Within its grasp, even the strongest become their own worst enemies.$B$BYou, however, have displayed courage and fortitude even in the face of this great danger. I feel faith that you will lead us to victory against our enemy.$B$B$n, I wish to pledge my loyalty in service of you and the druidic order' WHERE `ID` = 42038;
UPDATE `quest_offer_reward` SET `RewardText` = 'Something isn''t right here, $n. This isn''t the Dream. Could Xavius'' creatures have invaded our sanctuary? How did they get past our protective wards?' WHERE `ID` = 42040;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, I already feel the Nightmare''s power waning.' WHERE `ID` = 42041;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yay, they''re saved! Thank you!' WHERE `ID` = 42042;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. I knew that Elune''s power could purify the nightmare''s taint. Her blessing is strong here.' WHERE `ID` = 42043;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today I grieve for a fallen ally, one who has wandered these forests for eons.$B$BHe can now be at peace, knowing he gave his life to protect this sacred place.' WHERE `ID` = 42044;
UPDATE `quest_offer_reward` SET `RewardText` = 'My grandfather, Malorne, the ancient god of the wilds himself... long have I wished for this day, only to find that he is in great peril.$B$BIf he is trapped in the Nightmare, then what hope remains for the rest of us?' WHERE `ID` = 42045;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for all of your heroic efforts, great $c. Without your help, we could not have recovered the Idol and spoken to Malorne himself.$B$BNow that we know he is trapped in the Nightmare, we can devise a plan.' WHERE `ID` = 42046;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have served the wilds for as long as I can remember, mentoring young druids and watching them grow in knowledge and experience.$B$BThere are few who have ascended to the rank of archdruid, but I believe you can become one of our best.$B$BI would be honored to follow your leadership of the grove.' WHERE `ID` = 42047;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, hi $n! My woodland friends just couldn''t stop talking about you after you left, and it was they who convinced me to come find you here!$B$BA noble druid with your courage and kindness just doesn''t come along every day.$B$BThis is going to be SO much fun, don''t you think?' WHERE `ID` = 42048;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. These shards are positively surging with negative energy. Be careful when touching them, $n.' WHERE `ID` = 42049;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well chosen. The others will aid me in defending here. We must hurry.' WHERE `ID` = 42050;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do not be deceived, $n. What appears to be the mountains of Hyjal, is in fact an illusion created by our enemy.$B$BThis is a re-creation of the darkest nightmare in Malorne''s mind. This is the War of the Ancients, a battle that occurred thousands of years ago.$B$BIt was during this war that Azeroth was first threatened by the Burning Legion, and the War in which Malorne and the Wild Gods fell.' WHERE `ID` = 42051;
UPDATE `quest_offer_reward` SET `RewardText` = 'You lead us to triumph today, $n.' WHERE `ID` = 42053;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have come a long way together, $n. At every step, your choices have led the Dreamgrove to victory.$B$BI would give my life to defend Azeroth, and I know you would do the same.$B$BGreat danger still faces us. $n, take my pledge. We must serve and protect the wilds!' WHERE `ID` = 42056;
UPDATE `quest_offer_reward` SET `RewardText` = 'So, the Mistress of Twilight was actually a dragon... I thought the brood of Sintharia had all been defeated.$B$BI wonder if Zeryxia was not the last of her kind...
' WHERE `ID` = 42065;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good that you have arrived, Farseer $n. The Twilight''s Hammer has built a formidable stronghold here in Deepholm.
' WHERE `ID` = 42068;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is T''uure! I had thought it was lost to us forever!$B$BWhen I last saw this staff we were escaping from a small world called Niskara. The Legion came upon us unawares, we were only able to escape thanks to a few brave Vindicators who remained behind with T''uure to stall their attack.$B$BI did not think it could be done, but you were able to recover T''uure. You truly walk in the light, $n. You have my respect, and my thanks.
' WHERE `ID` = 42074;
UPDATE `quest_offer_reward` SET `RewardText` = 'And not a moment too soon. Our scouts report the Underking himself has come.' WHERE `ID` = 42088;
UPDATE `quest_offer_reward` SET `RewardText` = 'You never disappoint, $n.$B$BThis otherwise forgotten soul will now serve a greater purpose.
' WHERE `ID` = 42098;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your troops have done well. Our soul shard supply is sufficient enough to create the anchor.
' WHERE `ID` = 42100;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our scouting efforts have hopefully paid off. I have a lead on a $C who might possess the skills we need to perform the summoning ritual.$B$BWe should follow up as soon as possible.
' WHERE `ID` = 42102;
UPDATE `quest_offer_reward` SET `RewardText` = 'This should be more than enough blood to satiate the Bloodstone.
' WHERE `ID` = 42103;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re after the great worm? You must be very foolish or very brave$B$BI know these mountains inside and out. Help me avenge my village and I will help you find the foul beast.
' WHERE `ID` = 42110;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have seen you before, Farseer.$B$B<Lord Neptulon judges you silently for a moment before continuing.>$B$BI sense the potential for great power within you. We shall see if this prophecy holds true...
' WHERE `ID` = 42114;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your champion did well! Archmage Omniara agreed to join us and is getting situated as we speak.' WHERE `ID` = 42126;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done. These troops will be invaluable in our fight against the Burning Legion. Deploy them on missions, just as you would with our champions.' WHERE `ID` = 42127;
UPDATE `quest_offer_reward` SET `RewardText` = 'The two of them are puppets of Kil''jaeden and a bane on our existence. I am glad that you have their warglaives.$B$BThey will be that much easier to kill when we invade their world.$B$BI wonder, do you have a moment to discuss a rather urgent issue?
' WHERE `ID` = 42131;
UPDATE `quest_offer_reward` SET `RewardText` = 'There is just one thing left to do.
' WHERE `ID` = 42132;
UPDATE `quest_offer_reward` SET `RewardText` = 'These weapons will work well against Hakkar and his minions. I''ll ensure that they are distributed to our allies.
' WHERE `ID` = 42133;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s my honor to be of service to the Unseen Path. I''ll help in any way I can.
' WHERE `ID` = 42134;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your willingness to help is admirable, and it gives me insight into what kind of leader you will be.$B$BI know you mean to gather priests from all factions and lead them in a battle against the Burning Legion. It''s an extraordinary task, but one that you will not have to embark on alone.
' WHERE `ID` = 42137;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have a good feelin'' about ya, $n. Dis terrible day really started to turn around when ya showed up.$B$BSome might call it luck, but I think it''s fate. We were meant to cross paths.$B$BDis could be da beginnin'' a somethin'' great.
' WHERE `ID` = 42138;
UPDATE `quest_offer_reward` SET `RewardText` = 'So, I guess I''ll be hangin'' out with Vanessa here a lot? Don''t you worry ''bout nothin''.$B$BShe and I are gonna be besties.$B$BSay, you gotta moment?
' WHERE `ID` = 42139;
UPDATE `quest_offer_reward` SET `RewardText` = 'Gold! The rogues, thieves, and cutthroats are gonna start rollin'' in.$B$B<Nikki looks over at Vanessa and says in a whisper.>$B$BMaybe we''ll even get some unemployed Defias to sign up. Too soon?
' WHERE `ID` = 42140;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. These troops will be invaluable in our defense of the Broken Isles. Deploy them on missions, just as you would with our champions.
' WHERE `ID` = 42142;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Lunastre family is well-connected. They will be of great help to us when the time comes.' WHERE `ID` = 42147;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''d better take those back to the Hall of the Guardian for safekeeping, $n.' WHERE `ID` = 42149;
UPDATE `quest_offer_reward` SET `RewardText` = 'They''re using fel magic. I knew there was something off about them, but I never suspected this!' WHERE `ID` = 42166;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Dreamweavers thank you.' WHERE `ID` = 42170;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for uncovering the truth about the Empyrean Society, $n!' WHERE `ID` = 42171;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good to see you here, $n. There is much to be done!' WHERE `ID` = 42175;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Earthen Ring champions sent to Skywall have successfully returned to the class hall.$B$BThe plane of air is currently in a state of turmoil, however our champions identified a powerful elemental who may be willing to aid our cause.
' WHERE `ID` = 42184;
UPDATE `quest_offer_reward` SET `RewardText` = 'Chen and Li Li are two of the greatest monks in recent history.$B$BAs long as they stay out of trouble, they will be great representatives of our order.
' WHERE `ID` = 42187;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n! I can see that the Order of the Broken Temple is in good hands.
' WHERE `ID` = 42191;
UPDATE `quest_offer_reward` SET `RewardText` = 'What is it you seek? Are you here to pilfer heirlooms like the others?
' WHERE `ID` = 42193;
UPDATE `quest_offer_reward` SET `RewardText` = 'Uniting the elements won''t be easy, Farseer $n. You''ll be needin'' all the help you can get!$B$BAye, These are dark times indeed... but we''ll face ''em t''gether, don''t you worry.$B$BOl'' Mylra has yer back, Farseer.$B$BNow, let''s get a move on then! There ain''t no time to waste!
' WHERE `ID` = 42198;
UPDATE `quest_offer_reward` SET `RewardText` = 'The mission to Deepholm was a success. The champions of the Earthen Ring made contact with Therazane, but the situation there is worse than we feared...
' WHERE `ID` = 42200;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is done! The armies of Ulduar are bound by oath to join us now that we''re in possession of the Gjallerhorn!
' WHERE `ID` = 42204;
UPDATE `quest_offer_reward` SET `RewardText` = 'I like you, $n. You don''t hesitate to take action when necessary!' WHERE `ID` = 42206;
UPDATE `quest_offer_reward` SET `RewardText` = 'It seems that our mission to the Firelands was a success, Farseer. We have much to discuss.
' WHERE `ID` = 42208;
UPDATE `quest_offer_reward` SET `RewardText` = 'It was very lucky that we were able to retrieve those scrolls. Number Nine Jia''s help will be invaluable to our order.
' WHERE `ID` = 42210;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ravandwyr speaks very highly of how you dealt with the Empyrean Society, $n.' WHERE `ID` = 42222;
UPDATE `quest_offer_reward` SET `RewardText` = 'You could not have arrived at a better time, $r.' WHERE `ID` = 42223;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do you have any idea what you have done?!' WHERE `ID` = 42226;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must move swiftly.' WHERE `ID` = 42227;
UPDATE `quest_offer_reward` SET `RewardText` = 'Such a temporary home will serve us well.' WHERE `ID` = 42229;
UPDATE `quest_offer_reward` SET `RewardText` = 'My order guards a powerful secret. We are the keepers of the final resting place of the mighty Tyr!$b$bRecent intrusions have proven his tomb''s location to be a secret no longer. We must protect the sacred relic stored there... the Silver Hand!' WHERE `ID` = 42231;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Highmountain tribes thank you.' WHERE `ID` = 42233;
UPDATE `quest_offer_reward` SET `RewardText` = 'Of course they would attack now.$b$bThose withered devils couldn''t have chosen a more effective time to strike. My brood already suffers.' WHERE `ID` = 42271;
UPDATE `quest_offer_reward` SET `RewardText` = 'With Arkethrax and his minions dealt with it should help prevent them from flanking Illidari Stand. Well done.' WHERE `ID` = 42367;
UPDATE `quest_offer_reward` SET `RewardText` = 'That should stall these demons for a time. We may need to return in the future to ensure they have not regrouped.' WHERE `ID` = 42368;
UPDATE `quest_offer_reward` SET `RewardText` = 'If you think the explosion was big on our side of the portal, you should see what the other side looks like. Ha!' WHERE `ID` = 42369;
UPDATE `quest_offer_reward` SET `RewardText` = 'And... it looks like we''re out of time for today''s wand practice. Go on, then. Off to your next class!' WHERE `ID` = 42370;
UPDATE `quest_offer_reward` SET `RewardText` = 'My hand is beginning to tire from taking so many notes. I think it''s time we took a break.' WHERE `ID` = 42371;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. Stormcaller Mylra and Duke Hydraxis are worthy champions. We can trust them to carry out any task we ask of them.
' WHERE `ID` = 42383;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve received word from our scouts, and just in time it seems. There are plenty of people out there who could use our help.
' WHERE `ID` = 42384;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t know who sent you, but I sure hope you''re here to help.
' WHERE `ID` = 42385;
UPDATE `quest_offer_reward` SET `RewardText` = 'Whatever you did out there, it worked. The hounds'' attacks have slowed.$B$BLet''s hope that the villagers can get some rest, and live to fight another day.
' WHERE `ID` = 42386;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. I think the children will be able to sleep better tonight knowing that those assassins aren''t lurking just outside their door.
' WHERE `ID` = 42387;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m so glad we''re able to help people once again. Your work in Bradensbrook just proves how much the Unseen Path is needed.$B$BSince you''ve been away, we''ve had reports pouring in from all over Azeroth. With our ranks a little low, I''m not sure we''ll be able to keep up.
' WHERE `ID` = 42388;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re from the lodge on the hill, am I right? I''ve heard of your order, a respectable group no doubt, but a bit dull for my tastes.
' WHERE `ID` = 42390;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for securing Cora''s release. She''s still a bit skittish, but I think she''ll recover in time.
' WHERE `ID` = 42391;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is so good to have Hilaire back at the lodge. Her dedication and skill will be useful in the times to come.
' WHERE `ID` = 42393;
UPDATE `quest_offer_reward` SET `RewardText` = 'Whether they know it or not, the people of Azeroth have the Unseen Path to thank for their safety.
' WHERE `ID` = 42394;
UPDATE `quest_offer_reward` SET `RewardText` = 'You traveled all this way to see Baron? It''s been a long time since we''ve had visitors.
' WHERE `ID` = 42397;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t know what kind of bones you and Baron found in these fields, but he hasn''t had this much energy since he was a pup!
' WHERE `ID` = 42398;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work recruiting Huntsman Blake. His hound could be the key to tracking down Khadgar''s mages.
' WHERE `ID` = 42399;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for meeting me, $n.
' WHERE `ID` = 42400;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Houndmaster is an ancient and powerful demon who has attacked our world once before.$B$BHis return could have dire consequences for mages throughout Azeroth.
' WHERE `ID` = 42401;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our allies have all gathered here at the lodge and are waiting to be updated on the situation.
' WHERE `ID` = 42402;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re from the lodge up on the hill, aren''t ya?
' WHERE `ID` = 42403;
UPDATE `quest_offer_reward` SET `RewardText` = 'With the faction leader''s help and your leadership, Hakkar doesn''t stand a chance.
' WHERE `ID` = 42405;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Houndmaster has done some interesting things with this breed of felhound.
' WHERE `ID` = 42406;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is unsettling news. If our weapons won''t work against Hakkar''s minions, how are we going to defeat him?$B$BWe should call in our allies and see what they can do to help.
' WHERE `ID` = 42407;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve been expecting you, $n. Ohn''ahra''s presence told me that change would be coming.$B$BThe Highmountain tribes have long been allies of the Unseen Path.$B$BMy ancestors welcomed Namuria and her hunters to our land, and together, they helped build the lodge you stand in today.$B$BI am honored to serve at your side.
' WHERE `ID` = 42409;
UPDATE `quest_offer_reward` SET `RewardText` = 'An old threat has resurfaced, stronger than ever. Azeroth needs hunters like you who are willing to survive at all costs.$B$BAs the leader of the Unseen Path, many will look to you for guidance. Show them that they can survive.$B$BI will stand beside you, and together we will send a message that we can endure, even in the face of an enemy as great as the Burning Legion.
' WHERE `ID` = 42410;
UPDATE `quest_offer_reward` SET `RewardText` = 'You brought a tear to this old man''s eye by bringing Baron back to life. I never thought I''d miss his ear-piercing howls, but I did. It''s a wonderful thing to see him working again.$B$BWe''re happy to help wherever we''re needed.
' WHERE `ID` = 42412;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ya did a fine job takin'' down that bird.$B$BMaybe I was wrong about you hunters up in that lodge. Clearly ya know what you''re doin''.$B$BI''d be happy to hunt by your side again, as long as you''re huntin'' big game!
' WHERE `ID` = 42413;
UPDATE `quest_offer_reward` SET `RewardText` = 'Have we met before? Your face seems a bit familiar.' WHERE `ID` = 42418;
UPDATE `quest_offer_reward` SET `RewardText` = 'The nightfallen thank you.' WHERE `ID` = 42421;
UPDATE `quest_offer_reward` SET `RewardText` = 'The wardens thank you.' WHERE `ID` = 42422;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hmm. This appears to be Archmage Vargoth''s notes on the Nightborne Soulstone. Supposedly the energy of captured souls stored within it can be channeled directly from the stone! If that''s true, it is very powerful, indeed!' WHERE `ID` = 42423;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good news! Your champion found Archmage Vargoth entering the Arcway Vaults in Suramar.' WHERE `ID` = 42424;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, your eyes gleam with newfound knowledge, $n.$b$bThat staff of yours has seen the passing of many mortal lifetimes. <Cough> It can teach you a great many things, if you''re willing to listen.$b$bAs for its memories... they may be unreliable. You may find a different reflection haunts the streets of Dalaran each day. I leave it to you to find them all.' WHERE `ID` = 42429;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good; you found me, $n.' WHERE `ID` = 42434;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. Now we should be able to enter the Empyrean Society enclave and have a look around.' WHERE `ID` = 42435;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our alliance with the Skyhorn is stronger than ever, thanks to your efforts.
' WHERE `ID` = 42436;
UPDATE `quest_offer_reward` SET `RewardText` = 'The world of the living will forever revile us for the dark task that we begin this day...
' WHERE `ID` = 42449;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good to see you again, $n.' WHERE `ID` = 42451;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, Deathlord. One of the Horde''s greatest generals in life now serves you in undeath as your first horseman!
' WHERE `ID` = 42484;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh my sweet little Korine! Thank you, thank you!' WHERE `ID` = 42486;
UPDATE `quest_offer_reward` SET `RewardText` = 'How lucky we are that it could be recovered... thank you.' WHERE `ID` = 42488;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. It is one thing I no longer need to think about.' WHERE `ID` = 42490;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent! I will study this immediately.' WHERE `ID` = 42491;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is true, then. Archmage Vargoth has been corrupted by the legion.' WHERE `ID` = 42493;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good job, $n.' WHERE `ID` = 42494;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ll keep them busy outside while you head in.' WHERE `ID` = 42508;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must prepare. There is much to do.
' WHERE `ID` = 42510;
UPDATE `quest_offer_reward` SET `RewardText` = 'So I take it things went well then?$B$BA ritual of that magnitude requires a bit of recovery time. You cannot expect to perform it more than once a day.
' WHERE `ID` = 42517;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. Emmarel Shadewarden and Loren Stormhoof are worthy champions. We can trust them to carry out any task we ask of them.
' WHERE `ID` = 42519;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope you are able to put Millhouse''s determination to good use!' WHERE `ID` = 42521;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, your champions were successful with their mission! We may be seeing some new faces around here soon.
' WHERE `ID` = 42523;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. These troops will be invaluable in our defense of the Broken Isles. Deploy them on missions, just as you would with our champions.
' WHERE `ID` = 42524;
UPDATE `quest_offer_reward` SET `RewardText` = 'The scouting mission was more successful than we could have imagined, $n. Your troops were able to rescue Survivalist Bahn, a cunning strategist.$B$BIn thanks, he has agreed to lend his skill to our cause.
' WHERE `ID` = 42525;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent choice, $n. Survivalist Bahn has made the lodge his home, so just speak to him when you want to make upgrades.
' WHERE `ID` = 42526;
UPDATE `quest_offer_reward` SET `RewardText` = 'For what purpose do you intrude upon my kingdom, $C? Speak quickly, for I have little patience...
' WHERE `ID` = 42533;
UPDATE `quest_offer_reward` SET `RewardText` = 'Soon the heads of my enemies shall line the walls of my kingdom! These shall be the first of many.$B$BNot even Sylvanas will dare to step foot upon the free kingdom of Stromgarde!
' WHERE `ID` = 42534;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done my kingdom a service, $C. Stromgarde will not forget the service you have done us this day.
' WHERE `ID` = 42535;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have tarried here long enough, Deathlord. The time has come to open the tomb and raise our champion.
' WHERE `ID` = 42536;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today, a great king has risen from the dead to once more take up the sword in the name of liberty.$B$BIt will be an honor to fight at his side against the legions of terror.
' WHERE `ID` = 42537;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done. I knew that Sister Lilith would come through for us.' WHERE `ID` = 42585;
UPDATE `quest_offer_reward` SET `RewardText` = 'Not only was the mission a success, but our champions recovered an inscribed leaf of ancient knowledge. These may be of great interest to Leafbeard the Storied, the Ancient of Lore who resides to the north.' WHERE `ID` = 42586;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done! I see that Leafbeard''s advice has already been useful.' WHERE `ID` = 42588;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ll make sure to give the grimoire to Malevolence so that she can unravel its mysteries.$B$BMeanwhile, we have some Black Temple scouting to conduct.
' WHERE `ID` = 42594;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are ready to command your forces. Let us begin!
' WHERE `ID` = 42598;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent choice, $n. Archivist Melinda will remain within Dreadscar Rift, so just speak to her when you want to upgrade more of the class hall.
' WHERE `ID` = 42601;
UPDATE `quest_offer_reward` SET `RewardText` = 'The scouting mission was more successful than we could have imagined, $n. Your troops were able to rescue Archivist Melinda, a brilliant strategist.$B$BIn thanks, she has agreed to lend her skill to our cause.
' WHERE `ID` = 42602;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ritssyn and Calydus were successful in getting information, though we don''t know how reliable it is, considering how it was obtained.
' WHERE `ID` = 42603;
UPDATE `quest_offer_reward` SET `RewardText` = 'Odyn''s putting you in charge, eh? Count me in. I find it generally unwise to question the gods.
' WHERE `ID` = 42605;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will gladly follow you, $n. I''ve seen what you''re capable of and you have no fear of death.
' WHERE `ID` = 42606;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. Hjalmar will have the valarjar whipped into shape in no time.
' WHERE `ID` = 42607;
UPDATE `quest_offer_reward` SET `RewardText` = 'It says a lot that Ritssyn would give up his position and look to you for leadership. He must believe that you are the key to rebuilding the council.
' WHERE `ID` = 42608;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent! With the runecaster''s powers your armies will be even stronger!
' WHERE `ID` = 42610;
UPDATE `quest_offer_reward` SET `RewardText` = 'I spent enough time in the afterlife. Point me at the enemy and I will end them!
' WHERE `ID` = 42614;
UPDATE `quest_offer_reward` SET `RewardText` = 'You showed bravery in Ulduar, $n. I will fulfill my oath and answer the call of the Gjallarhorn.
' WHERE `ID` = 42618;
UPDATE `quest_offer_reward` SET `RewardText` = 'Jorhuttam! We must track the great worm at once. It will surely be a great battle.
' WHERE `ID` = 42651;
UPDATE `quest_offer_reward` SET `RewardText` = 'A little bit of oak can go a long way when making ammo.
' WHERE `ID` = 42654;
UPDATE `quest_offer_reward` SET `RewardText` = 'This looks like more than enough ore to craft weapons and ammo for our allies.
' WHERE `ID` = 42655;
UPDATE `quest_offer_reward` SET `RewardText` = 'Halduron''s blacksmith does fine work, but these weapons still need to be enchanted before they will work against Hakkar''s hounds.
' WHERE `ID` = 42656;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Sentinels told me you would be coming.$B$BI apologize for the state of my home. I''ve been having some trouble with unwanted guests, recently.
' WHERE `ID` = 42657;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''d get a lot more work done if I could convince you to stay, but I know you have pressing matters elsewhere.
' WHERE `ID` = 42658;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have no idea how relieved I am to see you!
' WHERE `ID` = 42659;
UPDATE `quest_offer_reward` SET `RewardText` = 'Once this heart is devoured, the Bloodstone will be strong enough to control the eredar sisters.
' WHERE `ID` = 42660;
UPDATE `quest_offer_reward` SET `RewardText` = 'The blue dragonflight has always represented magic on Azeroth, and it is fitting that we work together against the Burning Legion now more than ever. I would be honored to fight for you as your champion in these dark times.' WHERE `ID` = 42662;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have always admired Illidan''s singular vision. After all, the annihilation of the Burning Legion is of paramount importance. Nothing else matters. Nothing else can be allowed to stand in our way.$B$BYou will take me as your champion. In return, I will bring all of my knowledge and power to bear on the task at hand. In time, we will destroy all of our enemies... perhaps even Akama as well?
' WHERE `ID` = 42664;
UPDATE `quest_offer_reward` SET `RewardText` = 'And now we know that Caria and Varedis are hiding away on the demon world known as Niskara.$B$BTime to finish this.
' WHERE `ID` = 42669;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have selected your first two champions. There are great things ahead of us, $n.
' WHERE `ID` = 42670;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have selected your first two champions. There are great things ahead of us, $n.
' WHERE `ID` = 42671;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s about time, you big lummox. For a while there, when you chose Asha Ravensong first, I started to doubt your sanity.$B$BNot that there''s anything wrong with Asha. But, we both know who the better fighter is.$B$BRight?$B$BAnyway, of course, I''d be honored to be your champion. I accept!
' WHERE `ID` = 42673;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well, at least we''re going to have some fresh faces around here. If a broken''s face can ever be called fresh, that is.$B$B<Kor''vas smirks.>
' WHERE `ID` = 42677;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have it. Finally, we will be able to crack SI:7''s coded letter.
' WHERE `ID` = 42678;
UPDATE `quest_offer_reward` SET `RewardText` = 'Outstanding. These new Ashtongue will give you the flexibility you need to position troops wherever you see fit.
' WHERE `ID` = 42679;
UPDATE `quest_offer_reward` SET `RewardText` = 'I must admit, I was not expecting that. Mathias Shaw taken prisoner by the Legion.$B$BThat, at least, explains all of the strange actions SI:7 has been taking lately. They have a dreadlord in charge of them.
' WHERE `ID` = 42680;
UPDATE `quest_offer_reward` SET `RewardText` = 'They''ve returned with him. It''s Loramus, alright. But, he''s trapped within the body of the dreadlord, Razelikh the Defiler!$B$BUntil we can make sure he doesn''t pose a danger, I''ve ordered him kept in one of our demon traps, below.
' WHERE `ID` = 42681;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do we really need all of these ingredients to contact the Master''s soul?
' WHERE `ID` = 42682;
UPDATE `quest_offer_reward` SET `RewardText` = 'That sounds like good news. He is already contributing to the cause and we are that much stronger for his help.$B$BStill, he is not fully in control of Razelikh. I think it best that we leave him in that trap until we can find him a new body. Don''t you?$B$BAnd, if he proves to be too much of a problem, we can take ''other'' measures.
' WHERE `ID` = 42683;
UPDATE `quest_offer_reward` SET `RewardText` = 'Surprisingly nice bit of work there. What I am hearing from our scouts is that the diversions are working perfectly.$B$BAs an added bonus, some of my suspicions about a particular item, which will prove useful in deciphering the SI:7 letter, have come to light in Stormheim.
' WHERE `ID` = 42684;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to see the Tirisgarde rise again, $n. While not everyone on the Council of Six agrees with me, I believe it is imperative for us to work together and defeat the Burning Legion once and for all!' WHERE `ID` = 42685;
UPDATE `quest_offer_reward` SET `RewardText` = 'It was very lucky that we found Chronicler Elrianne among the survivors. A well-respected archivist from the Kirin Tor, she also spent several months studying with the pandaren in their library in Tian Monastery.$B$BHer knowledge of ancient magic will be invaluable to our order.' WHERE `ID` = 42687;
UPDATE `quest_offer_reward` SET `RewardText` = 'Faronaar is crawling with demons, some familiar, and some peculiar.
' WHERE `ID` = 42689;
UPDATE `quest_offer_reward` SET `RewardText` = 'An honor, $n. Of course I will serve as your champion and second-in-command. Could it have been any other way?$B$BWe have only just begun to move forward with the master''s plan, but already, you have made great strides. If we are to defeat the Burning Legion, we must remain vigilant. Any other goal pales in comparison. The fate of everything hangs in the balance.$B$BAt the end of the day, we will stand victorious... no matter the cost!
' WHERE `ID` = 42695;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n! I can see that the Hall of the Guardian is in good hands.' WHERE `ID` = 42696;
UPDATE `quest_offer_reward` SET `RewardText` = 'You want me to be one of your champions?$B$B<Asha thoughtfully ponders your request a moment.>$B$BI accept, but on one condition. I want you to put me into field duty. While I am of use here on the Fel Hammer, my talents will be put to better use back on Azeroth.$B$BBeyond that, I trust that the plan is still to bring the Burning Legion to its knees?
' WHERE `ID` = 42697;
UPDATE `quest_offer_reward` SET `RewardText` = 'What a rare honor. To be one of the Illidari, instead of a servant. I must admit, I was worried you wouldn''t choose me as one of your champions.$B$BBut now you have, and I could just kiss you!$B$BIt never made any sense to me that all worlds should be purged in flame when there are so many delicious playthings to have fun with. Sargeras can be such a bore. Together, we will bring the Burning Legion to its knees and make them grovel in the dirt.
' WHERE `ID` = 42701;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings, $n. The fires of Azeroth give us the power to see beyond ourselves.' WHERE `ID` = 42703;
UPDATE `quest_offer_reward` SET `RewardText` = '<The Arcane Destroyer makes a high pitched, quizzical chirp and looks at you expectantly.>' WHERE `ID` = 42704;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have been Archmage Vargoth''s apprentice for far too long. Perhaps it is time for me to serve a new master. I would be honored if you would accept me as your champion, $n.' WHERE `ID` = 42705;
UPDATE `quest_offer_reward` SET `RewardText` = 'You and I have proven to be quite successful together. I''d be happy to lend you my swords and spells against the Burning Legion anytime, $n.' WHERE `ID` = 42706;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good -- you''re back just in time! This will sustain Meryl while we search for his attacker.' WHERE `ID` = 42707;
UPDATE `quest_offer_reward` SET `RewardText` = 'Sylvanas will not be pleased with our actions, but we have more to worry about than offending the Dark Lady.
' WHERE `ID` = 42708;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh! Clean water, so pure and magical! Thank you, hero!' WHERE `ID` = 42719;
UPDATE `quest_offer_reward` SET `RewardText` = 'You let them go? I''m glad. I didn''t like being in a cage either...' WHERE `ID` = 42722;
UPDATE `quest_offer_reward` SET `RewardText` = 'No hard feelings, right? Business is business, baby, and business is good. I saw an opportunity and I took it, just like you.$B$BTo show my continued allegiance with your little organization, and as a gesture of goodwill, here''s a little sample of the product. It''s magic. Bottoms up!
' WHERE `ID` = 42730;
UPDATE `quest_offer_reward` SET `RewardText` = 'Of course. Like all Legion constructs, the Fel Hammer is powered by souls. You have collected some of the most powerful souls around.$B$BThey should be enough to take us anywhere you want to go.
' WHERE `ID` = 42733;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have done the unimaginable, $n. We are all in your debt. I am proud to henceforth name you Archmage $n!' WHERE `ID` = 42734;
UPDATE `quest_offer_reward` SET `RewardText` = 'I guess I underestimated you. Good. I like to learn and grow.$B$BUp to helping me out with one more little thing?
' WHERE `ID` = 42736;
UPDATE `quest_offer_reward` SET `RewardText` = 'Finally, revenge against Cordana Felsong for all of the demon hunters whom she tempted into becoming Felsworn. Cyana, Tirathon, Glayvianna, Cailyn, Illysanna, and more.$B$BHer death has been a long time coming.$B$BThe Sargerite Keystone is once more in our possession. Now, to look to the future.
' WHERE `ID` = 42752;
UPDATE `quest_offer_reward` SET `RewardText` = 'These will do nicely. We couldn''t have asked for better.$B$BTell me, were the demons angry when you stole their precious parts?
' WHERE `ID` = 42754;
UPDATE `quest_offer_reward` SET `RewardText` = 'With the Sargerite Keystone in our hands, all that we have to do is prepare our forces and formulate an invasion plan.
' WHERE `ID` = 42775;
UPDATE `quest_offer_reward` SET `RewardText` = 'You now have six champions, all of the Illidari and its forces, as well as a growing army of troops, all willing to make the ultimate sacrifice to bring down the Burning Legion.$B$BTime to prepare for the endgame.
' WHERE `ID` = 42776;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are choosing me as one of your champions?$B$B<Belath looks both surprised and pleased.>$B$BThis is a great distinction. I pledge myself to you again, $n. I will see to it that the enemies of the Illidari are dealt with in your name.
' WHERE `ID` = 42777;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s good to see you''ve prepared yourself. You never know what you''ll be facing out there.$b$bWe''ve commissioned these rings for high-ranking members of the Alliance. May this one protect you in the battle to come.' WHERE `ID` = 42782;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Wardens should have cooperated with us much sooner than this. Still, we now know that we need to go find the Warden, Malace Shade, in Stormheim. She was the one entrusted with safeguarding the Sargerite Keystone.$B$BThat information, combined with some scouting I did on my own, will point you in the right direction.$B$BWe''ll have the Keystone before you know it, $n.
' WHERE `ID` = 42787;
UPDATE `quest_offer_reward` SET `RewardText` = 'They will not so easily dismiss the Dusk Lily now. Well done.' WHERE `ID` = 42792;
UPDATE `quest_offer_reward` SET `RewardText` = 'Of course I will serve as your champion. In for a copper in for a gold as they say.$B$BWe work well together. I bring out the best in you.
' WHERE `ID` = 42800;
UPDATE `quest_offer_reward` SET `RewardText` = 'Glad to hear that Ariana has recovered and is ready to train up our first new demon hunters.$B$BIt''s been awhile since we had some fresh blood in our ranks.
' WHERE `ID` = 42808;
UPDATE `quest_offer_reward` SET `RewardText` = 'Kil''jaeden?! If that''s not the gauntlet being thrown down, I don''t know what is.$B$BCan we survive this, $n?
' WHERE `ID` = 42810;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good that you are here, Deathlord $n. The battle has already begun.
' WHERE `ID` = 42818;
UPDATE `quest_offer_reward` SET `RewardText` = 'Soon, the Scarlet Crusade shall be overrun, Deathlord $n. This battle is nearly finished...
' WHERE `ID` = 42821;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our path is clear now, Deathlord. The time has come for us to offer Sally Whitemane the opportunity for redemption.
' WHERE `ID` = 42823;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have heard that the battle at Scarlet Monastery was a success, thanks to you.$B$BInitiate Whitemane has already begun her training as a $C. She shows much promise, and I have no doubt she will make a formidable horseman.
' WHERE `ID` = 42824;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hmm, yes. It is as I suspected.' WHERE `ID` = 42828;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let me show you around, then.' WHERE `ID` = 42829;
UPDATE `quest_offer_reward` SET `RewardText` = 'You may want to cleanse your palate - we craft some strong flavors here!' WHERE `ID` = 42832;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will be certain to have a bottle of your arcwine prepared for you before you leave.' WHERE `ID` = 42835;
UPDATE `quest_offer_reward` SET `RewardText` = 'Much better. You have my thanks.' WHERE `ID` = 42836;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will have these... ah... souvenirs... boxed for you.' WHERE `ID` = 42837;
UPDATE `quest_offer_reward` SET `RewardText` = 'Margaux... no!' WHERE `ID` = 42838;
UPDATE `quest_offer_reward` SET `RewardText` = 'Steel yourself, $n.$b$bMargaux''s loss is regrettable, but not likely to be the last in this effort. Far from it, I fear.' WHERE `ID` = 42839;
UPDATE `quest_offer_reward` SET `RewardText` = 'Glad to know you understand the value of my services, partner.' WHERE `ID` = 42840;
UPDATE `quest_offer_reward` SET `RewardText` = 'Pleasure doing business with you.' WHERE `ID` = 42841;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. Both Lord Tyrosus and Lady Liadrin will serve proudly.' WHERE `ID` = 42846;
UPDATE `quest_offer_reward` SET `RewardText` = 'Maxwell Tyrosus has returned with important news. First, he did recover some survivors. They are recovering in the chapel now. Among them was Commander Ansela, a veteran paladin and trainer.$B$BAs for the second, I will let Sir Tyrosus tell you himself.' WHERE `ID` = 42847;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. These squires will fight well.' WHERE `ID` = 42848;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our mission was a success! Not only did we defeat the enemy, but we recruited Alamande Graythorn, a noted scholar from the Hearthglen archives.' WHERE `ID` = 42849;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I knew Sir Graythorn would come through.' WHERE `ID` = 42850;
UPDATE `quest_offer_reward` SET `RewardText` = 'For years I have heard of your deeds, Highlord. Now that I have fought at your side, I can say the stories were true.$B$BAllow me to represent the Order of the Silver Hand as a champion of the light, $n. I will fight justly and bravely, and carry out your orders to the end.
' WHERE `ID` = 42852;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah yes, this is the grell food supply. Perhaps I can use this to lure them away. Thank you.' WHERE `ID` = 42857;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for gathering everyone together.' WHERE `ID` = 42867;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have exciting news to share with you, $n.
' WHERE `ID` = 42869;
UPDATE `quest_offer_reward` SET `RewardText` = 'I look forward to joining the rest of our forces.
' WHERE `ID` = 42872;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent, Highlord. You''ve arrived.' WHERE `ID` = 42886;
UPDATE `quest_offer_reward` SET `RewardText` = 'Glorious.' WHERE `ID` = 42887;
UPDATE `quest_offer_reward` SET `RewardText` = 'No... we underestimated the enemy.
' WHERE `ID` = 42888;
UPDATE `quest_offer_reward` SET `RewardText` = 'When you suddenly vanished from our awareness we thought the worst.$b$bI do not know what to make of your adventures... I will need time to process this tragedy.$b$bRegardless, I am glad you are back safe and sound.' WHERE `ID` = 42889;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our mission to Faronaar was successful, no thanks to me.$B$BI let my anger get out of control, and I would have paid for it dearly were it not for you.$B$BThank you, Highlord.
' WHERE `ID` = 42890;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have been fighting the Burning Legion for an eternity, $n. I would be honored to impart my wisdom to you as you lead the fight against them once again. I believe I have picked up a few tricks they will not expect!' WHERE `ID` = 42914;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have saved my reputation, not to mention my life! Without your persistence, I would still be hanging above the Nexus yet, $n. I hope you will accept my everlasting gratitude.' WHERE `ID` = 42917;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent! The Legion will rue the day they set their sights on Azeroth!
' WHERE `ID` = 42918;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our mission is clear, but what are our next steps?' WHERE `ID` = 42919;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have won the day! Caria and Varedis are no more, and we have sent a clear message to the Burning Legion that they are vulnerable, even on their own worlds.$B$BIt is about time that we celebrated, but first...
' WHERE `ID` = 42920;
UPDATE `quest_offer_reward` SET `RewardText` = 'Who would have thought he would be working with us?$B$BWe are now one step closer to taking the fight directly to the Burning Legion on their own worlds.
' WHERE `ID` = 42921;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.$B$BThese salmon will help nourish our tribe.
' WHERE `ID` = 42929;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n.$B$BThis meat will help strengthen our troops.
' WHERE `ID` = 42930;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your champions have done well. I think I should be able to get you into the Oculus now.' WHERE `ID` = 42940;
UPDATE `quest_offer_reward` SET `RewardText` = 'Books on magical illnesses? I might know where such a thing exists...' WHERE `ID` = 42954;
UPDATE `quest_offer_reward` SET `RewardText` = 'Power in its purest form. It is a lovely color, is it not? A fitting gift for a book of healing. Will you come out old one, now that you are no longer lost and forgotten?' WHERE `ID` = 42955;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are wonderful! I couldn''t keep them for myself, of course. But... Can you hear the bees humming in the honey brew? They sing so sweetly... Oh! What a lovely idea! Thank you, little friends.' WHERE `ID` = 42959;
UPDATE `quest_offer_reward` SET `RewardText` = 'I thank you, $n. Without your help, one of Azeroth''s mightiest guardians would have fallen into the hands of the Legion.$B$BYou have proven you are capable of leading my armies and defeating the Legion in their own territory.
' WHERE `ID` = 42974;
UPDATE `quest_offer_reward` SET `RewardText` = 'What does the Earthen Ring want with an old servant of the Windseeker?
' WHERE `ID` = 42977;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. You have exactly the right amount of Mistral Essence necessary to restore the pillar!
' WHERE `ID` = 42983;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, this is it! With this, I will be able to bind the element of air nicely. And, maybe do some impressive tricks at future festivities.
' WHERE `ID` = 42984;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, Farseer. With events in his realm calmed, Windlord Thunderaan can focus his efforts on the war effort.
' WHERE `ID` = 42986;
UPDATE `quest_offer_reward` SET `RewardText` = 'Impressive, truly impressive, Farseer! Everything I believed about your prowess has been proven true.$B$BYou have helped mend the rift caused by our enemies on the Broken Isles. We can rest easier, knowing what we have accomplished.
' WHERE `ID` = 42988;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to see you, Farseer. We have much to discuss!
' WHERE `ID` = 42996;
UPDATE `quest_offer_reward` SET `RewardText` = 'This blade could indeed be the key to resurrecting the Windseeker. However, it has been damaged and the elemental soul within has diminished in power.$B$BTime may very well be running out...
' WHERE `ID` = 43002;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s true! The Egg of Gaiath does exist... right before my very eyes!
' WHERE `ID` = 43003;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good that Valeera was able to find you so quickly.$B$BThere is something important that you must immediately attend to.
' WHERE `ID` = 43007;
UPDATE `quest_offer_reward` SET `RewardText` = 'I saw. Not the healthiest-lookin'' bunch, but I''m sure they''ll do in a pinch.$B$BRegardless, they''ll be out with Vanessa and Garona, so what could go wrong?
' WHERE `ID` = 43013;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wonderful, yes yes! These supplies will fill our storehouse for weeks to come. Thank you so much, Grandmaster.
' WHERE `ID` = 43054;
UPDATE `quest_offer_reward` SET `RewardText` = 'What a beautiful catch! I''ve never seen fish this size! Thank you, Grand Master.
' WHERE `ID` = 43060;
UPDATE `quest_offer_reward` SET `RewardText` = 'I thank you, $n. That Hodir is gone is unfortunate, but things could have gone much worse and thanks to you Ulduar did not fall to the Legion today.
' WHERE `ID` = 43090;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $C. I''ll make good use of this.
' WHERE `ID` = 43151;
UPDATE `quest_offer_reward` SET `RewardText` = 'The kirin tor thank you.' WHERE `ID` = 43179;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am relieved that this weapon of destruction is no longer in the hands of our enemies.
' WHERE `ID` = 43182;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very astute of you to have saved the best for last.$B$B<Allari smirks playfully.>$B$BIn all seriousness, I am deeply honored that you have chosen me, $n. Something tells me that the worst is yet to come. We must remain vigilant and bring the Burning Legion to an end.
' WHERE `ID` = 43184;
UPDATE `quest_offer_reward` SET `RewardText` = 'Me? You want me to be one of your champions?$B$BYes, of course. A million times, yes! Just tell me where you want me to go, what you want me to do, and consider it done.
' WHERE `ID` = 43185;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your leadership has provided us with victory after victory. We gladly serve and will sacrifice everything in your name.$B$BAll hail, Slayer $n!
' WHERE `ID` = 43186;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now, what do you say you and I go to Val''sharah and recover the most powerful jewel in existence?
' WHERE `ID` = 43249;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that you are finally here, we can begin.$B$BThe elves here have somehow risen from the dead. They are deluded. They think that we are the Burning Legion and have come here to destroy Black Rook Hold.
' WHERE `ID` = 43250;
UPDATE `quest_offer_reward` SET `RewardText` = 'A ledger? Wait, let me look.$B$B<Valeera reaches out and begins thumbing through the tome''s pages.>$B$BThis is the key!
' WHERE `ID` = 43251;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. It means a great deal to me that you have given my ancient ancestors the peace they deserve.
' WHERE `ID` = 43252;
UPDATE `quest_offer_reward` SET `RewardText` = 'The legend was true! I was right about my suspicions. I had heard about Ravencrest''s almost perfect espionage team during the War of the Ancients. Now we know how they got their information.$B$BThe others will not believe it when we tell them. Of course, we could keep it to ourselves.$B$B<Valeera considers for a weighty moment.>$B$BNo. That is how the foolish and greedy lose their heads. We will spread the risk around to everyone.
' WHERE `ID` = 43253;
UPDATE `quest_offer_reward` SET `RewardText` = 'After all that, you want me as your champion?$B$B<Vanessa gives you a look of disbelief as she takes a moment before replying.>$B$BFine, but I do things my way. Agreed?
' WHERE `ID` = 43261;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, Deathlord. Nazgrim and Thassarian are powerful champions. I am sure they will carry out their orders with deadly precision.
' WHERE `ID` = 43264;
UPDATE `quest_offer_reward` SET `RewardText` = 'It appears that Nazgrim and Thassarian were successful in their mission. We have identified several promising candidates to aid us in the war against the Burning Legion.
' WHERE `ID` = 43265;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, Deathlord.$B$BThese ghouls will be invaluable in the war effort on the Broken Isles. Deploy them on missions just as you would your other champions.
' WHERE `ID` = 43266;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, Deathlord. The mission was a complete success.$B$BWith continued success in the field, the Burning Legion will surely be beaten back.
' WHERE `ID` = 43267;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was an excellent choice, Deathlord. Feel free to speak to Zubashi whenever you require further upgrades.
' WHERE `ID` = 43268;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. Calia Menethil and High Priestess Ishanah are worthy champions. We can trust them to carry out any task we ask of them.' WHERE `ID` = 43270;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $n. It''s an honor to serve at your side.$B$BI''m happy to help in any way I can.' WHERE `ID` = 43271;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your efforts to restore Saa''ra have not gone unnoticed. As a humble servant of the Sha''tar, I thank you.$B$BAs leader of the Aldor, it is my duty to safeguard all that is holy. This temple is a beacon of light that must be protected.$B$BYou can count me among your allies, willing to do whatever is necessary to destroy the Burning Legion.' WHERE `ID` = 43272;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. These troops will be invaluable in our defense of the Broken Isles. Deploy them on missions, just as you would with our champions.
' WHERE `ID` = 43275;
UPDATE `quest_offer_reward` SET `RewardText` = 'The scouting mission was more successful than we could have imagined, $n.$B$BYour troops were able to rescue Archon Torias, a skilled researcher whose knowledge extends far beyond light and shadow.$B$BIn thanks, he has agreed to lend his expertise to our cause.
' WHERE `ID` = 43276;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent choice, $n. Archon Torias will continue to conduct his research in Netherlight Temple. Speak to him when you want to make additional upgrades.
' WHERE `ID` = 43277;
UPDATE `quest_offer_reward` SET `RewardText` = 'I love Lady Lunastre like a sister, but I am afraid my hands are tied.' WHERE `ID` = 43310;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very well. Let us talk strategy.' WHERE `ID` = 43311;
UPDATE `quest_offer_reward` SET `RewardText` = 'He is unharmed! I owe you- and Ly''leth- a great debt.' WHERE `ID` = 43312;
UPDATE `quest_offer_reward` SET `RewardText` = 'It seemed as though you had that well in hand. I did not want to... interrupt.$b$bThat is one less power hoarding noble to worry about. Well done, $n.' WHERE `ID` = 43315;
UPDATE `quest_offer_reward` SET `RewardText` = 'This may not end as cleanly as I would have preferred.' WHERE `ID` = 43317;
UPDATE `quest_offer_reward` SET `RewardText` = 'We made great strides today. I will not forget this.' WHERE `ID` = 43318;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will do my best to teach the way of the tiger, Grandmaster: to observe the enemy, and strike without hesitation. Soon, our initiates will be ready for battle.
' WHERE `ID` = 43319;
UPDATE `quest_offer_reward` SET `RewardText` = 'A moment to reminisce on how far we have come. A day to look to the future and where we might go. A year of reflection on what it means to grow and a lifetime of memories made by those brave enough to seize it.' WHERE `ID` = 43323;
UPDATE `quest_offer_reward` SET `RewardText` = 'You built your campfire with ease, and put a perfect sear on that steak. I''m impressed... and hungry.
' WHERE `ID` = 43335;
UPDATE `quest_offer_reward` SET `RewardText` = 'That tiger is serious about this, isn''t he?$B$BWhile you were here, others came to the Temple of the White Tiger to present their offerings to him. It looks like we''re going to have some competition.
' WHERE `ID` = 43338;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. We still have a long road ahead of us to rid this world of the Legion, but this brings us one step closer.
' WHERE `ID` = 43341;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Aegis of Aggramar is secure within the well-defended city of Dalaran.$B$BYour quest to drive back the Legion is one step closer to fruition.' WHERE `ID` = 43349;
UPDATE `quest_offer_reward` SET `RewardText` = 'May the new powers of your weapon aid you in the times ahead.
' WHERE `ID` = 43359;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. This place will never recover, but their madness need not harm others.' WHERE `ID` = 43360;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will study these carefully. If we are fortunate, there will be answers.' WHERE `ID` = 43361;
UPDATE `quest_offer_reward` SET `RewardText` = 'I do not know how you obtained this, but I know it was not easy. Much stands against us, but you prevailed. Come. Let us restore the arcan''dor.' WHERE `ID` = 43362;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you... it gives Brightwing much peace to know that life continues.' WHERE `ID` = 43365;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your heroic efforts within the Emerald Dream were inspiring, $n. The Dream is safe for now, but it remains threatened as long as Xavius lives.$B$BI will lend you my aid. Together, let us keep Azeroth safe from those who would seek its destruction.' WHERE `ID` = 43368;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s a good thing ya showed up when you did.$B$BSo Velen wants to induce a vision? That''s no easy task, but it''s nothing Yalia and I can''t handle.
' WHERE `ID` = 43373;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your quick thinking got me out of a terrible situation. Thank you, $n.
' WHERE `ID` = 43374;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve found the ingredients we''ll need for Velen''s elixir.
' WHERE `ID` = 43376;
UPDATE `quest_offer_reward` SET `RewardText` = 'We will not let this demon determine our fate. You have the power to change our future.$B$BI have seen the path to salvation, and you will lead us there.$B$BI must retire for now. The weight of this vision has taken its toll on my mind and body.
' WHERE `ID` = 43379;
UPDATE `quest_offer_reward` SET `RewardText` = 'Born of Light, I fight for Light.
' WHERE `ID` = 43380;
UPDATE `quest_offer_reward` SET `RewardText` = 'I owe you my life, and so much more.$B$BYou saw something in me worth saving, and allowed me to eventually believe that as well.$B$BLet me live my life with purpose, $n. Let me fight by your side.
' WHERE `ID` = 43381;
UPDATE `quest_offer_reward` SET `RewardText` = 'You pulled my spirit from the Void, which is no easy feat. I cannot deny the part of me that would stay there forever, embraced by the shadows.$B$BThe Void is filled with many whispers, $n. The kind that should have us all worried.$B$BWe cannot afford to be separated by our beliefs. We must come together as priests of both Light and Shadow to face the Burning Legion together.
' WHERE `ID` = 43382;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are in excellent condition! Thank you, $n.
' WHERE `ID` = 43384;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your efforts have provided us with the information we need to move forward.$B$BIt''s been discovered that there are a few defectors among the Scarlet Onslaught.
' WHERE `ID` = 43385;
UPDATE `quest_offer_reward` SET `RewardText` = 'Why are you here? Why bother saving me? I was prepared to die. I should pay for the terrible things I''ve done...
' WHERE `ID` = 43386;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Light truly shines upon me, $n. Your presence has proven that.
' WHERE `ID` = 43387;
UPDATE `quest_offer_reward` SET `RewardText` = 'The mercy you have shown brings tears to my eyes.
' WHERE `ID` = 43388;
UPDATE `quest_offer_reward` SET `RewardText` = 'Is this the enemy we should welcome as an ally?
' WHERE `ID` = 43389;
UPDATE `quest_offer_reward` SET `RewardText` = 'Alonsus sent you, did he? He''s never shown much interest in us before.$B$BOf course, we''ve never been ones to follow the Light, at least not in the way that most would want us to.$B$BWe embrace the Shadows as well, finding our faith in the balance between both extremes.
' WHERE `ID` = 43390;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is it! This is the journal that contains the spell to locate Natalie''s spirit!
' WHERE `ID` = 43391;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Forsaken will rejoice at Natalie Seline''s return, and we will as well, knowing that the prophecy is being fulfilled.
' WHERE `ID` = 43393;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank the Light, $C. I didn''t want to give up hope.
' WHERE `ID` = 43394;
UPDATE `quest_offer_reward` SET `RewardText` = 'The intelligence you have gathered is further proof that the prophecy cannot be ignored. The Legion''s attack is imminent, and we will not survive without the paladins as our allies under the Light.
' WHERE `ID` = 43396;
UPDATE `quest_offer_reward` SET `RewardText` = 'We will help defend Netherlight Temple and lay a trap for Balnazzar.
' WHERE `ID` = 43397;
UPDATE `quest_offer_reward` SET `RewardText` = 'This should be enough to make the necessary improvements to our defenses.
' WHERE `ID` = 43399;
UPDATE `quest_offer_reward` SET `RewardText` = 'There''s enough lumenstone here to craft armor and weapons for an army. Nice work, $n.
' WHERE `ID` = 43400;
UPDATE `quest_offer_reward` SET `RewardText` = 'You fought well, High $C.
' WHERE `ID` = 43401;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are a leader worthy of our praise, High $C.
' WHERE `ID` = 43402;
UPDATE `quest_offer_reward` SET `RewardText` = 'May the new powers of your weapon serve you well.
' WHERE `ID` = 43407;
UPDATE `quest_offer_reward` SET `RewardText` = 'With this new power, the Legion will fall!' WHERE `ID` = 43409;
UPDATE `quest_offer_reward` SET `RewardText` = 'May the new powers of your weapons serve you well.
' WHERE `ID` = 43412;
UPDATE `quest_offer_reward` SET `RewardText` = 'May this power aid you in the times ahead.' WHERE `ID` = 43415;
UPDATE `quest_offer_reward` SET `RewardText` = 'May this power aid you in the times ahead.
' WHERE `ID` = 43418;
UPDATE `quest_offer_reward` SET `RewardText` = 'May the new powers of your weapon serve you well.
' WHERE `ID` = 43420;
UPDATE `quest_offer_reward` SET `RewardText` = 'May your new weapons serve you well.
' WHERE `ID` = 43422;
UPDATE `quest_offer_reward` SET `RewardText` = 'May the new powers of your weapon serve you well.
' WHERE `ID` = 43423;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is decided then.' WHERE `ID` = 43441;
UPDATE `quest_offer_reward` SET `RewardText` = 'That ought to do it. I will make sure that The Wolf gets every drop.$B$BThank you, $n.
' WHERE `ID` = 43468;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well, now we know that our SI:7 friend is being held at Felsoul Hold in Suramar. Not sure why we didn''t check there first.$B$BI trust that you already have a general plan for how to retrieve him? I know that I do. Perhaps we can put our heads together.
' WHERE `ID` = 43469;
UPDATE `quest_offer_reward` SET `RewardText` = 'Want to earn a few quick coins? I need subjects to try my newest potion.$B$BUnfortunately, I can''t taste this one myself because it contains a few ingredients that I''m allergic to. Drinking this would be incredibly toxic to me. In fact, as far as I''m concerned, this is just one big bottle of poison.$B$BDrink up!
' WHERE `ID` = 43474;
UPDATE `quest_offer_reward` SET `RewardText` = 'Want to earn a few quick coins? I need a new subject to try one of my favorite potion recipes.$B$BI have to admit, the last few times I tried to make a potion like this, it didn''t work out so well for the test subjects. In fact, this is why I have to pay people to drink my potions now.$B$BPlease enjoy.
' WHERE `ID` = 43476;
UPDATE `quest_offer_reward` SET `RewardText` = 'A wise choice of targets indeed. The Uncrowned are fortunate to count you amongst our ranks, Mister $n.
' WHERE `ID` = 43479;
UPDATE `quest_offer_reward` SET `RewardText` = 'Aponi sent you? How is she? It is hard to keep in touch with friends in these times.
' WHERE `ID` = 43486;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank the Light, Highlord. I didn''t want to give up hope.
' WHERE `ID` = 43490;
UPDATE `quest_offer_reward` SET `RewardText` = 'Highlord, I owe you my life and my thanks. You live by the Light, as my Sunwalkers believe.$B$BIt is an honor to fight by your side, and with your permission, I would like to continue fighting for the Order of the Silver Hand.
' WHERE `ID` = 43492;
UPDATE `quest_offer_reward` SET `RewardText` = 'Incredible, Highlord. With the threat at Black Rook Hold contained, we can focus efforts on other areas.
' WHERE `ID` = 43493;
UPDATE `quest_offer_reward` SET `RewardText` = 'Senegos has generously offered us his assistance in the journey ahead.$B$BA truly kind soul.
' WHERE `ID` = 43496;
UPDATE `quest_offer_reward` SET `RewardText` = 'It would seem our tree is quite thirsty.' WHERE `ID` = 43502;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done. We can use this to disable the magic protecting the Heart.
' WHERE `ID` = 43514;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for bringing Delas with you, $n. I knew she could help us.
' WHERE `ID` = 43535;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion has plans to attack the priests'' center of command? It is critical that you discovered this information in time, Highlord.$B$BIt makes sense that the Legion would target Prophet Velen and his followers. We cannot allow Balnazzar to succeed.
' WHERE `ID` = 43540;
UPDATE `quest_offer_reward` SET `RewardText` = 'I believe you have chosen well, Highlord. We will help defend Netherlight Temple and lay a trap for Balnazzar.$B$BThe priests of the Conclave are formidable allies. With our combined strength, we may just have a chance against Balnazzar.
' WHERE `ID` = 43541;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must take drastic measures.' WHERE `ID` = 43562;
UPDATE `quest_offer_reward` SET `RewardText` = 'These will do nicely.' WHERE `ID` = 43563;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. With this, the chances of me teleporting you all to the bottom of the sea are much lower!' WHERE `ID` = 43565;
UPDATE `quest_offer_reward` SET `RewardText` = 'Behold. The redemption of the Nightfallen.' WHERE `ID` = 43567;
UPDATE `quest_offer_reward` SET `RewardText` = 'At last... we are free.' WHERE `ID` = 43568;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, Deathlord. The cords of this braid will be used in the fashioning of reins for our steeds.$B$BI assume Dargrul was more than willing to part with it, yes?$B$B<Salanar flashes an evil grin.>
' WHERE `ID` = 43571;
UPDATE `quest_offer_reward` SET `RewardText` = 'At long last, the Nightmare Lash! Holding it in my hands, I can feel the truth of the legends.$B$BSuch power... such darkness... such... anguish!$B$BYes, this will do nicely.
' WHERE `ID` = 43572;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Ebon Blade''s success on the battlefield has not gone unnoticed by the Burning Legion.$B$BAs we continue the war effort, we must be mindful of increased attention from the forces of Sargeras...
' WHERE `ID` = 43573;
UPDATE `quest_offer_reward` SET `RewardText` = 'The legendary Maul of the Dead... it resonates with the hatred and despair of countless anguished souls. As a tool of misery, it is the embodiment of perfection.
' WHERE `ID` = 43574;
UPDATE `quest_offer_reward` SET `RewardText` = 'Already my mind is sharper.' WHERE `ID` = 43576;
UPDATE `quest_offer_reward` SET `RewardText` = 'You and your armies have accomplished much. Odyn chose his commander well.
' WHERE `ID` = 43585;
UPDATE `quest_offer_reward` SET `RewardText` = 'A glorious victory! It''s unfortunate that Helya survived, but she will think twice about moving against us with you leading the armies of Skyhold.
' WHERE `ID` = 43586;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very good!$B$BIf you haven''t been to this realm before, I have learned a trick or two to give you your "Sea Legs," allowing you to breathe underwater for the duration of our mission here.$B$BNow, let''s find out missing $C and the scepter she was looking for!
' WHERE `ID` = 43644;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see now what I did not see before. My destiny was written long ago.$B$BThis burden has always been mine to bear.
' WHERE `ID` = 43686;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for leading us to victory. All hail, Highlord $n!
' WHERE `ID` = 43697;
UPDATE `quest_offer_reward` SET `RewardText` = 'There''s enough lumenstone here to craft armor and weapons for an army. Thank you, Highlord.
' WHERE `ID` = 43698;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, Highlord. Too many dangers abound in these dark times. With heroes like you out there, we are all a little bit safer.
' WHERE `ID` = 43699;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am sure you have many questions, Highlord $n. It was fate that our paths crossed that day on Niskara.$B$BI serve High Exarch Turalyon and Lady Alleria Windrunner. When the Legion turned its armies toward Azeroth, I was sent here to help protect it.$B$BHow I got to Niskara is a tale for another time, but had it not been for you, I would still be Balnazzar''s prisoner.$B$BNow, I can fulfill my original mission. Let me fight for you. Together, we will drive back the Burning Legion!
' WHERE `ID` = 43701;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have my thanks, and the gratitude of the Broken, hero. Many would have considered us an acceptable loss, yet you have shown us great compassion and kindness. An act that I - we - will not soon forget.$B$BNow we will return to the Vault of Lights and assist Velen as best we can.' WHERE `ID` = 43705;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am honored beyond words, $n. I will gladly serve as your champion.$B$BPoint me in the right direction. I can sneak anywhere. Find out anything.
' WHERE `ID` = 43723;
UPDATE `quest_offer_reward` SET `RewardText` = 'Shall we form an alliance, you and I? Of course, I dare not officially become one of the Uncrowned, let alone the Council of Shadows.$B$BI am the leader of SI:7 after all.$B$BBut, when you need my assistance or guidance, you need but ask. I will be there. We will work together through back channels to ensure that the Burning Legion is destroyed.
' WHERE `ID` = 43724;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are lovely. Just lovely. I''ll get to work right away.$B$BKeep us in mind with any resources the Tirisgarde can spare. If you can keep the researchers busy, we should unfold everything there is to know about your weapon in no time.
' WHERE `ID` = 43749;
UPDATE `quest_offer_reward` SET `RewardText` = 'With the paladins on our side, united under the Light, the prophecy is fulfilled.$B$BWe must now prepare. Balnazzar will attack, and we need to be ready.
' WHERE `ID` = 43797;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. We will be able to defend our borders for now.
' WHERE `ID` = 43812;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are as dependable as you are resourceful.
' WHERE `ID` = 43832;
UPDATE `quest_offer_reward` SET `RewardText` = 'Arrr! Now that be what I like t'' hear.$B$BWhat do you think, Crackers... will a bunch o'' freebooters class up this crow''s nest or scuttle th'' ship? I say it''s a fair toss o'' th'' bones.
' WHERE `ID` = 43841;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I''ll get back to you with the results as soon as I can.
' WHERE `ID` = 43877;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I''ll get back to you with the results as soon as I can.
' WHERE `ID` = 43878;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I''ll get back to you with the results as soon as I can.
' WHERE `ID` = 43879;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I''ll get back to you with the results as soon as I can.
' WHERE `ID` = 43880;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I''ll get back to you with the results as soon as I can.
' WHERE `ID` = 43881;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I''ll get back to you with the results as soon as I can.
' WHERE `ID` = 43883;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. I''ll get back to you with the results as soon as I can.
' WHERE `ID` = 43884;
UPDATE `quest_offer_reward` SET `RewardText` = 'On it, boss. Will get back to you soon!
' WHERE `ID` = 43885;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. I''ll get back to you with what I''ve learned soon.
' WHERE `ID` = 43886;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very good. I''ll get back to you with the results soon.
' WHERE `ID` = 43887;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, Deathlord. The missions for the Steeds of the Damned were successful. Salanar the Horseman now has the first set of necessary components for conjuring the steeds.
' WHERE `ID` = 43899;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, $n.$B$BThese supplies are crucial to crafting the elixirs we will need for the upcoming battle.
' WHERE `ID` = 43923;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work, $n.$B$BThese supplies are crucial to crafting the elixirs we will need for the upcoming battle.
' WHERE `ID` = 43924;
UPDATE `quest_offer_reward` SET `RewardText` = 'With the Aggregates of Anguish procured, our work is nearly complete. Soon, the Steeds of the Damned will rise... and the Burning Legion will fall!
' WHERE `ID` = 43928;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, Highlord.
' WHERE `ID` = 43934;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. You can begin as soon as you are ready.
' WHERE `ID` = 43935;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very well. Your allies have gathered here on the precipice - they will know how best to proceed.$B$BMay the winds be ever in your favor, Farseer.
' WHERE `ID` = 43945;
UPDATE `quest_offer_reward` SET `RewardText` = 'A powerful weapon for a powerful champion of the Halls. Let us begin.
' WHERE `ID` = 43949;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will help you, but first I need you to do something for me.' WHERE `ID` = 43969;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will rally the worthy in Odyn''s name.
' WHERE `ID` = 43975;
UPDATE `quest_offer_reward` SET `RewardText` = 'A sound choice.' WHERE `ID` = 43980;
UPDATE `quest_offer_reward` SET `RewardText` = 'Did you sense the protectors of the wilds? Their presence is ever with us.' WHERE `ID` = 43991;
UPDATE `quest_offer_reward` SET `RewardText` = 'Kil''jaeden took the child from Velen, let Velen believe that the boy had been killed, then raised the child as an agent of the Burning Legion with the express purpose of murdering his own father? That bastard waited 13,000 years to exact vengeance upon Velen for defying Sargeras and the Legion? The Deceiver indeed...$B$BFor Velen to have to experience such tragedy after what he and his people have already been through is heartbreaking. Such a thing would test anyone''s faith.' WHERE `ID` = 44004;
UPDATE `quest_offer_reward` SET `RewardText` = 'Most curious indeed! This is no object of the Legion''s making. Let me have a closer look.' WHERE `ID` = 44009;
UPDATE `quest_offer_reward` SET `RewardText` = 'I know of Coryn. We will not underestimate his venom, rest assured.$b$bThank you for helping Aurore. She is a dear friend of mine.' WHERE `ID` = 44040;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is a relief, if a small one. You have done well - rest for now.' WHERE `ID` = 44052;
UPDATE `quest_offer_reward` SET `RewardText` = 'She certainly is a worthy companion.' WHERE `ID` = 44053;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, Archdruid.' WHERE `ID` = 44074;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent, Arch Druid.' WHERE `ID` = 44075;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am sad to hear of Oakheart''s demise, but his soul will live on.' WHERE `ID` = 44076;
UPDATE `quest_offer_reward` SET `RewardText` = 'Wonderful. This is exactly what we need.' WHERE `ID` = 44077;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings, Deathlord. It is an honor to serve you.$B$BI have been keeping an eye on the casualties of the Alliance and Horde upon the battlefield. Supply is limited, but there are some very promising prospects...
' WHERE `ID` = 44082;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good to see you, $n. My apprentices are learning rapidly and are ready to serve you.' WHERE `ID` = 44098;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s so good to see friend once again.
' WHERE `ID` = 44099;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very well, I yield - I yield!$B$BCurse you, $C, and that weapon of yours. Without it the Grimtotem would''ve been victorious.$B$BTake your lousy supplies. But we will be back!
' WHERE `ID` = 44101;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see by the blood spatters that Jace revealed the demons to you. I trust the young king is safe.$b$bWe have more work ahead of us, $c. Much more.' WHERE `ID` = 44120;
UPDATE `quest_offer_reward` SET `RewardText` = 'I must find a way...' WHERE `ID` = 44152;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must find a solution. We are running out of time.' WHERE `ID` = 44156;
UPDATE `quest_offer_reward` SET `RewardText` = 'SI:7 made a secret deal with The Red Blade to hunt down Amber Kearnen?$B$BIt seems that Master Mathias Shaw was willing to pay any cost to have her dealt with...
' WHERE `ID` = 44177;
UPDATE `quest_offer_reward` SET `RewardText` = 'Aww, yesss! That''s the stuff!$B$B<Noggenfogger pops the cork and dabs some of the potion on his finger.>$B$BHave mercy! WOWZA! I''m going to need some time alone with this stuff!
' WHERE `ID` = 44178;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is a dangerous mystery we''ve stumbled upon, $n. It would not be fair for me to stand idly by as you risk your life to uncover this corruption.$B$BAfter all, without honor and brotherhood among thieves, none of us will stand to profit!$B$BFrom this point on, I''ll pledge my personal services against the threat of the Burning Legion and the dark mystery we are unraveling. My blade is yours, $n...
' WHERE `ID` = 44183;
UPDATE `quest_offer_reward` SET `RewardText` = 'Shadowblade $n, always a pleasure. I was in the area on Alliance business and decided to drop in. It looks like our operations are faring well.$B$BMy people procured what look to be some rather nice armaments for the cause. I''m sure that you know best how to distribute them.$B$BThough we must continue to cooperate through back channels and behind closed doors, know that for the duration of the war against the Burning Legion, you can count on my support and that of SI:7.
' WHERE `ID` = 44203;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. You''re going to like this.
' WHERE `ID` = 44214;
UPDATE `quest_offer_reward` SET `RewardText` = 'I think you will appreciate this. I must admit to a certain level of envy.
' WHERE `ID` = 44215;
UPDATE `quest_offer_reward` SET `RewardText` = 'We is with you, $n!
' WHERE `ID` = 44217;
UPDATE `quest_offer_reward` SET `RewardText` = 'Word has been sent. The Seal will arrive soon.
' WHERE `ID` = 44226;
UPDATE `quest_offer_reward` SET `RewardText` = 'We are with you, $n.' WHERE `ID` = 44232;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yours is the path we will follow, $n.
' WHERE `ID` = 44233;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our hearts and minds are with you, $n.' WHERE `ID` = 44240;
UPDATE `quest_offer_reward` SET `RewardText` = 'These Knights of the Ebon Blade are a powerful order, Deathlord.$B$BThat you command such respect amongst their ranks speaks to your strength and leadership.$B$BDuring my life, I always fought to preserve my kingdom and people. But for my failure as a father, their blood now stains my hands.$B$BSo, I will wash the failure from my hands with the blood of demons. The time has come for me to return to the fray. My sword is yours to command.
' WHERE `ID` = 44243;
UPDATE `quest_offer_reward` SET `RewardText` = 'Words cannot fully express my gratitude for rescuing me, $n. In truth, I always knew that the Ebon Blade would not forsake me.$B$BI do not wish to elaborate on my years in captivity. That time has passed and we are now presented with an imminent danger in the Burning Legion.$B$BMy blade is yours, Deathlord. My life and my allegiance are yours to command.
' WHERE `ID` = 44244;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Four Horsemen of the Ebon Blade are gathered together, but our work has only just begun.$B$BThe Burning Legion has come to our world hungering for destruction, but we will feed them their own demise. Apocalypse awaits the demon invaders and we shall bring it to them!$B$BDeathlord, you have triumphed where no others could have succeeded. I shall lead the Four Horsemen like my father before me, and so long as I lead them our loyalty is yours!$B$BThe return of the Four Horsemen is at hand!
' WHERE `ID` = 44248;
UPDATE `quest_offer_reward` SET `RewardText` = 'We stand with you, $n.
' WHERE `ID` = 44250;
UPDATE `quest_offer_reward` SET `RewardText` = 'We are with you, $n.
' WHERE `ID` = 44251;
UPDATE `quest_offer_reward` SET `RewardText` = 'We stand with you, $n.
' WHERE `ID` = 44253;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Council admires your power, $n.
' WHERE `ID` = 44254;
UPDATE `quest_offer_reward` SET `RewardText` = 'The might of the Valarjar stands with you, $n.
' WHERE `ID` = 44255;
UPDATE `quest_offer_reward` SET `RewardText` = 'Were you able to overcome Neltharion''s Lair?
' WHERE `ID` = 44265;
UPDATE `quest_offer_reward` SET `RewardText` = 'So this is the legendary Frozen Soul Pendant! I sense a great power in this item...$B$BI will begin my study of it at once. You have my gratitude, Deathlord.
' WHERE `ID` = 44282;
UPDATE `quest_offer_reward` SET `RewardText` = 'I think that is wise. We need every weapon we can gather to defeat the Legion once and for all.
' WHERE `ID` = 44383;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have been waiting for you, Farseer.
' WHERE `ID` = 44406;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was probably the easiest decision you''ve had to make! Let''s get started.
' WHERE `ID` = 44407;
UPDATE `quest_offer_reward` SET `RewardText` = 'Dead? The titans are dead?$B$B<Khadgar ponders the news for a minute.>$B$BIt explains so much, yet I cannot help but feel an overwhelming sense of sadness. We have been on our own all along. Our gods killed before we were born.$B$BAs for the Army of the Light and Illidan, I am at a loss. I have never felt so powerless.$B$BIllidan is dead and the Golden Army fights an endless war in our name from across the cosmos.$B$BI need a moment, $n. This is too much bad news for an old man to bear.' WHERE `ID` = 44448;
UPDATE `quest_offer_reward` SET `RewardText` = 'An auspicious start to a life of tragedy. Perhaps one of the few joyous memories Illidan would have in his life. While the years that followed tested the prophesied child, they would never break him. You must remember that, despite what you may see as our journey continues.$B$BThere is much more to be done, but I am not yet ready. I will call for you when it is time.' WHERE `ID` = 44464;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings, Farseer $n. I have been waiting for you.$B$BThe Earthcallers are ready and at your command!
' WHERE `ID` = 44465;
UPDATE `quest_offer_reward` SET `RewardText` = 'Failure. Rejection. From that day, Illidan would be haunted by both. Ever undaunted, he would continue the search for his destiny. Another path would be found.' WHERE `ID` = 44466;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now listen closely.' WHERE `ID` = 44492;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do your best to pick this up the first time - I do hate repeating myself.' WHERE `ID` = 44493;
UPDATE `quest_offer_reward` SET `RewardText` = 'Perhaps there is hope for outlanders after all.' WHERE `ID` = 44495;
UPDATE `quest_offer_reward` SET `RewardText` = 'Glad to see you back on your feet, $n. Many good soldiers who sailed for the Broken Shore were not so fortunate.
' WHERE `ID` = 44543;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good that you are here, Farseer $n. We have much to discuss.
' WHERE `ID` = 44544;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have work to do!
' WHERE `ID` = 44556;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done! At least now most of the remaining demons we have to deal with are currently inside the tower.$B$BCouldn''t be more than a thousand or two, I''m sure.
' WHERE `ID` = 44557;
UPDATE `quest_offer_reward` SET `RewardText` = 'We shall help the shal''dorei find harmony.' WHERE `ID` = 44562;
UPDATE `quest_offer_reward` SET `RewardText` = 'Finally, my long lost brethren can return to this world. Elves belong beneath a starry sky - not a conjured one.$B$BThank you, $p.' WHERE `ID` = 44563;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Spires of Arak flame.
' WHERE `ID` = 44570;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Talador flame.
' WHERE `ID` = 44571;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Nagrand flame.
' WHERE `ID` = 44572;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Gorgrond flame.
' WHERE `ID` = 44573;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Azsuna flame.
' WHERE `ID` = 44574;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Val''Sharah flame.
' WHERE `ID` = 44575;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Highmountain flame.
' WHERE `ID` = 44576;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Stormheim flame.
' WHERE `ID` = 44577;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Shadowmoon Valley flame.
' WHERE `ID` = 44579;
UPDATE `quest_offer_reward` SET `RewardText` = 'Desecrate the Horde''s Frostfire Ridge bonfire!
' WHERE `ID` = 44583;
UPDATE `quest_offer_reward` SET `RewardText` = 'Honor the Suramar flame.
' WHERE `ID` = 44613;
UPDATE `quest_offer_reward` SET `RewardText` = 'Desecrate the Horde''s Suramar bonfire!
' WHERE `ID` = 44627;
UPDATE `quest_offer_reward` SET `RewardText` = 'The withered have been assembled and are ready for their training.' WHERE `ID` = 44636;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done well. Our enemies tremble before you and your armies.
' WHERE `ID` = 44667;
UPDATE `quest_offer_reward` SET `RewardText` = 'Keep a lookout for those crystal formations all over Suramar. We will need them.' WHERE `ID` = 44672;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are an inspiration to us all, $n.
' WHERE `ID` = 44680;
UPDATE `quest_offer_reward` SET `RewardText` = 'The power within you grows, $n. You will serve the council well.
' WHERE `ID` = 44682;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion''s hold wanes. Our time to strike grows nearer.
' WHERE `ID` = 44683;
UPDATE `quest_offer_reward` SET `RewardText` = 'Every bit contains an essence of sorts - one we can study to learn things about the magic wielder and ways to manipulate their magic for... other purposes.
' WHERE `ID` = 44684;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve bought us precious time.
' WHERE `ID` = 44685;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, conjuror. With heroes like you at the helm, the Tirisgarde is a force to be reckoned with!' WHERE `ID` = 44689;
UPDATE `quest_offer_reward` SET `RewardText` = 'At last, I have enough Blood of Sargeras to fuel my creations! You will see, Deathlord, what my genius is truly capable of creating...$B$BNow, I must ask that you leave me to my work... there is much to do, and we have little time to waste!
' WHERE `ID` = 44690;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, I am feeling much better. Thank you!$B$BNow let us get to work.' WHERE `ID` = 44691;
UPDATE `quest_offer_reward` SET `RewardText` = 'It would seem that you have done an excellent job of eliminating a great many threats on the Broken Isles.$B$BYou never fail to impress me, $n.
' WHERE `ID` = 44694;
UPDATE `quest_offer_reward` SET `RewardText` = 'I must commend your knack for overcoming adversity. Take your time gathering your fellow champions, $n, but don''t take TOO long!' WHERE `ID` = 44719;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good of you to come.' WHERE `ID` = 44720;
UPDATE `quest_offer_reward` SET `RewardText` = 'She has forced my hand...' WHERE `ID` = 44721;
UPDATE `quest_offer_reward` SET `RewardText` = 'Glad you could make it.' WHERE `ID` = 44722;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hopefully more will follow their example.$b$bThank you for showing them another way to serve the Nightborne.' WHERE `ID` = 44723;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for taking this risk. Let us put an end to this now!' WHERE `ID` = 44725;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done. Let us leave before they call in reinforcements.' WHERE `ID` = 44726;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our worst fears have been proven true, $n. The Legion''s presence is deeply rooted in the tower.$B$BThe time has come. We must take back Karazhan!
' WHERE `ID` = 44733;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for saving me. It seems we underestimated Elisande''s power.' WHERE `ID` = 44736;
UPDATE `quest_offer_reward` SET `RewardText` = 'The telemancy traps you placed prior to the battle are doing wonders for reducing our losses.' WHERE `ID` = 44738;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, hero. With this as our staging ground, our forces have a clear shot at the city gates.$b$bThalyssra has ordered her rebels to secure our location and cover our rear flank.$b$bOnce we have our siege vehicles in place we should be ready to assault the city.' WHERE `ID` = 44740;
UPDATE `quest_offer_reward` SET `RewardText` = 'We need to take action immediately!' WHERE `ID` = 44742;
UPDATE `quest_offer_reward` SET `RewardText` = 'All that remains is to focus on his essence to isolate his location. Good work.' WHERE `ID` = 44752;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was... difficult... but I am glad we succeeded.' WHERE `ID` = 44753;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will see that he is made comfortable next chance I get. We made a great stride forward today, $n.$b$bElisande will not soon forget that we do not simply abandon our own.' WHERE `ID` = 44756;
UPDATE `quest_offer_reward` SET `RewardText` = 'Around the isles, the very blood of our enemy attempts to corrupt all things. But as you may already know, this blood can be extracted.$B$BWe demon hunters use this blood for our own rituals, fueling us to fight back the demon invasion.$B$BBring me any Blood of Sargeras you find and I will trade with you what I can.
' WHERE `ID` = 44760;
UPDATE `quest_offer_reward` SET `RewardText` = 'The samples have proven to be quite helpful along with your... influence.
' WHERE `ID` = 44764;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hmm. An interesting challenge!' WHERE `ID` = 44766;
UPDATE `quest_offer_reward` SET `RewardText` = 'That is one less Legion supporter we need to worry about. Oh, and you found a shield generator too? Wonderful!' WHERE `ID` = 44768;
UPDATE `quest_offer_reward` SET `RewardText` = 'Delicious, thank you.$B$BBefore we act, we must gather more information onto what Helya is planning.' WHERE `ID` = 44771;
UPDATE `quest_offer_reward` SET `RewardText` = 'Finally you''re here, Deathlord. I''ve been waiting so long I could''ve died again.
' WHERE `ID` = 44775;
UPDATE `quest_offer_reward` SET `RewardText` = 'Don''t worry, she''ll be alright.$B$BWhatever demon did this to her didn''t hang around long enough to finish the job.' WHERE `ID` = 44782;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our victory here is well deserved. With their forces subdued we can press our attacks to the forward camp and the monstrosity on the horizon.' WHERE `ID` = 44789;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done. Sometimes a single victory is enough to bring an army together. With time, these recruits shall train others, and we can grow our army to many times this size.' WHERE `ID` = 44790;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Doomstone! I thought it legend, but here it is before me$B$BCan you feel its power radiating? We must only use it in times of utmost need; its power has a heavy price.$B$BYou were right not to give it to Magatha. It could do much harm in her hands.$B$BI trust you to keep it safe while we prepare an appropriate home for it.
' WHERE `ID` = 44800;
UPDATE `quest_offer_reward` SET `RewardText` = 'These people owe their lives to your bravery. They will not forget the risks we have taken for them.' WHERE `ID` = 44814;
UPDATE `quest_offer_reward` SET `RewardText` = 'So what do you say? Up for a challenge?' WHERE `ID` = 44821;
UPDATE `quest_offer_reward` SET `RewardText` = 'The trainees you helped cannot seem to stop talking about your fighting prowess. Already they are passing along what you taught them.$b$bI appreciate your help in this.' WHERE `ID` = 44827;
UPDATE `quest_offer_reward` SET `RewardText` = 'These weapons should prove quite useful in the coming conflict. Well done, hero.' WHERE `ID` = 44829;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. The knowledge in these books should prove very useful in the days to come.' WHERE `ID` = 44830;
UPDATE `quest_offer_reward` SET `RewardText` = 'It appears Ly''leth was correct. This is an entrance to the Nightwell - and it is well protected. Nothing is impenetrable though.$b$bLet us have a look at the ley lines powering this shield, shall we?' WHERE `ID` = 44832;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. With him out of the way we will be able to establish a stronger foothold once the main force arrives.' WHERE `ID` = 44842;
UPDATE `quest_offer_reward` SET `RewardText` = 'Nice work. They will not be opening that portal again any time soon.' WHERE `ID` = 44843;
UPDATE `quest_offer_reward` SET `RewardText` = 'A portal that big will not be reopening any time soon. I would say that counts as weakening their defenses.' WHERE `ID` = 44844;
UPDATE `quest_offer_reward` SET `RewardText` = 'I can relate to Thalyssra''s frustration.$B$BI remember when I launched my first offensive. I swear I didn''t eat or sleep for a week.
' WHERE `ID` = 44859;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. Hopefully, since our forces saw you performing this task they will come to their senses and stop this harassment.
' WHERE `ID` = 44860;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is done. Helya''s reign comes to an end and now we move forward. You have done a great thing today, champion. Consider yourself counted among those in the Halls of Valor.
' WHERE `ID` = 44868;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to see you. I could use a helping hand.' WHERE `ID` = 44870;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was a little terrifying. Sometimes I am not entirely sure that Oculeth knows what he is doing.' WHERE `ID` = 44873;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was more infuriating than it should have been. At least her natural talents mostly matched my calculations...' WHERE `ID` = 44874;
UPDATE `quest_offer_reward` SET `RewardText` = 'You believe Skovald didn''t want you to find this crystal, eh? Let me have a look.$B$B<Khadgar peers at the fel crystal fragment, tracing the lines of power that run through it.>$B$BI have seen this sort of crystal before. They are used to convey orders that come from the highest ranks of the Legion.$B$BThis is not good.
' WHERE `ID` = 44886;
UPDATE `quest_offer_reward` SET `RewardText` = 'So someone stole the Focusing Iris and you suspect Xylem might be the culprit? You may be right. $B$BIt is no secret that the archmage has been seeking artifacts of late. However, after the discovery of an ancient grimoire in the Legashi ruins, Xylem has become... unstable. I fear the grimoire may be stealing his mind.$B$BI can help you gain audience with the archmage. With any luck, you can reclaim the Iris peacefully.
' WHERE `ID` = 44914;
UPDATE `quest_offer_reward` SET `RewardText` = 'Were you able to defeat the evils within Karazhan?
' WHERE `ID` = 44917;
UPDATE `quest_offer_reward` SET `RewardText` = 'I do not know what lies in store for us, but we cannot sit idly while Ly''leth is missing.$B$BWe must act now!' WHERE `ID` = 44918;
UPDATE `quest_offer_reward` SET `RewardText` = 'The withered... defeated so easily.$B$BWe must find a way to negate the magic of the felborne. We cannot afford to fight if our own can be turned against us.' WHERE `ID` = 44919;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is as I feared, the archmage is beyond reason... and now he is beyond reach.$B$BYou have done a great thing here, freeing his apprentices from his corruption, but this fight is not over yet.
' WHERE `ID` = 44924;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is as I feared. Hopefully they will think twice before sending more spies.' WHERE `ID` = 44928;
UPDATE `quest_offer_reward` SET `RewardText` = 'She looked good. The Arcan''dor truly is a miracle for our people.$b$bShe is a welcome ally in the fight to come. Silgryn will take good care of her.' WHERE `ID` = 44955;
UPDATE `quest_offer_reward` SET `RewardText` = 'The preparations are nearly complete. Oculeth will be ready to teleport us soon.' WHERE `ID` = 44964;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oculeth will be quite pleased with your findings. As you know, he''s been working diligently on a new device for the withered.' WHERE `ID` = 45062;
UPDATE `quest_offer_reward` SET `RewardText` = 'The withered seem to be adapting quite well.' WHERE `ID` = 45063;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our efforts have proven quite successful. I believe we are just about ready to make our stand.' WHERE `ID` = 45064;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will begin analyzing this data at once.$B$BFor now, let us turn our attention to more... <Oculeth touches his fingertips together in succession.>$B$B...interesting technological advances.' WHERE `ID` = 45065;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let us begin.' WHERE `ID` = 45067;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ok, I''ll let your champions come and prove themselves in the ring. If they manage to win themselves a fight, come talk to me again and we can see about letting them fight harder brawls.
' WHERE `ID` = 45111;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m pleasantly surprised, $c. Without your quick thinking, your mage friend would be lost to Agatha.

The portal is stabilized, and should lead to the mage''s location.' WHERE `ID` = 45125;
UPDATE `quest_offer_reward` SET `RewardText` = 'Disgusting! I can''t believe I let myself fall under the spell of such a creature! 

I was such a fool! She made me think she really cared about me. In the end, it seems nothing I thought I knew about Agatha was true!' WHERE `ID` = 45126;
UPDATE `quest_offer_reward` SET `RewardText` = 'So Levia is safe? That is a relief, though I wish we could have reached her sooner. An imp mother is bad enough - I can''t imagine what Agatha will be capable of with Levia''s power. And who knows what secrets Levia shared while under her thrall?

I''m afraid that this battle may not be over yet.

For now, we should celebrate whatever victories we can get. Thank you for your assistance, $n.' WHERE `ID` = 45127;
UPDATE `quest_offer_reward` SET `RewardText` = 'I trust you obtained all the ancient mana we need to infuse the cube?
' WHERE `ID` = 45160;
UPDATE `quest_offer_reward` SET `RewardText` = 'A letter? From one of the cultists? $B$BThat could be the lead we need!' WHERE `ID` = 45185;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well, this definitely says... something.' WHERE `ID` = 45187;
UPDATE `quest_offer_reward` SET `RewardText` = 'What''s this, a cultist''s manifesto?  $B$BSo Raest has really gone down a dark path, hasn''t he?' WHERE `ID` = 45188;
UPDATE `quest_offer_reward` SET `RewardText` = 'My brother is here!' WHERE `ID` = 45190;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''re too late, the rift has closed!$B$BWe''ll have to find another way to get to him.' WHERE `ID` = 45192;
UPDATE `quest_offer_reward` SET `RewardText` = 'So Raest escaped? This is unfortunate. $B$BStill, I will rest easier knowing the Nethersworn cultists will no longer skulk in the streets of Dalaran. I thank you for that.$B$BThe Kirin Tor will set out at once to figure out how we can reach Raest in the Twisting Nether. I will send for you when we find a way to reach him.' WHERE `ID` = 45193;
UPDATE `quest_offer_reward` SET `RewardText` = 'So they did intercept her messages! I hope Ly''leth is okay...$B$BWe must investigate this breach she spoke of immediately!' WHERE `ID` = 45209;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done it! Was the wyrm truly gargantuan? Oh, nevermind, size is relative...$B$BLet us get this focus into the cube and see what it does!
' WHERE `ID` = 45238;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let us get to work, shall we?' WHERE `ID` = 45251;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will ask this of you again, as more fruit is ready.$B$BFor now, we have some disturbing news to discuss.' WHERE `ID` = 45260;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, now to set our attention to those still suffering within the city.' WHERE `ID` = 45261;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very well, let us go.' WHERE `ID` = 45263;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. Now let us see to business at the warfront.' WHERE `ID` = 45265;
UPDATE `quest_offer_reward` SET `RewardText` = 'Just in time. We are ready to begin.' WHERE `ID` = 45267;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am glad we can still cure my people, but... I have troubling news.' WHERE `ID` = 45268;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very well. Let us begin.' WHERE `ID` = 45269;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, you made it.
' WHERE `ID` = 45301;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. Every day we come closer to freedom for Suramar.' WHERE `ID` = 45316;
UPDATE `quest_offer_reward` SET `RewardText` = 'Leadership is a difficult burden, $n.$B$BWe must often split our attention - be sure to keep the big picture in mind.
' WHERE `ID` = 45317;
UPDATE `quest_offer_reward` SET `RewardText` = 'You got most of our scouts out alive. And Lady S''theno appears somewhat chastened, at least. Well done!
' WHERE `ID` = 45330;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, Deathlord. I see you were successful.
' WHERE `ID` = 45331;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was quite a hit you took...$B$BFrankly, I''m amazed that the Fel Hammer didn''t self destruct when we fired her weapons. We are lucky to be alive.
' WHERE `ID` = 45339;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, good. So the Conclave received my request. I didn''t expect they''d send their leader!
' WHERE `ID` = 45343;
UPDATE `quest_offer_reward` SET `RewardText` = 'I hope you handled these samples with care, $n. I wouldn''t forgive myself if I was responsible for getting the High $C sick.
' WHERE `ID` = 45344;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. I thought those goats seemed a little strange.
' WHERE `ID` = 45345;
UPDATE `quest_offer_reward` SET `RewardText` = 'While there is no hope of curing those who have reached stage III, at least they will be able to provide crucial information about how the contagion works.
' WHERE `ID` = 45346;
UPDATE `quest_offer_reward` SET `RewardText` = 'Brilliant work, $n. For a moment I thought I''d need to find a new companion.
' WHERE `ID` = 45347;
UPDATE `quest_offer_reward` SET `RewardText` = 'To say you''ve earned your archmage status would be an understatement. Your success today proves that you were born one.$B$BNow mount your new vessel and ride against the Legion with all the might of your knowledge.
' WHERE `ID` = 45354;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for being here, $n.$B$BUltimately the Nightborne must shape their own destiny, regardless of the help we have received from Outlanders like yourself.$B$BIt is no easy burden we bear, but Elisande has shown us that we must stand alone, without the Nightwell, to properly rejoin the world.$B$BThank you for all you have done for us.
' WHERE `ID` = 45372;
UPDATE `quest_offer_reward` SET `RewardText` = 'About time, Sslayer $n. We have work to do.
' WHERE `ID` = 45385;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have gone above and beyond to honor our pact, Sslayer $n. You know I''m not one for sappy speechess, but I assure you that I am grateful.$B$BI will take my place by your side if you will have me.
' WHERE `ID` = 45391;
UPDATE `quest_offer_reward` SET `RewardText` = 'During my training, Mograine told me of what we could achieve with this harness. I look forward to the results.
' WHERE `ID` = 45398;
UPDATE `quest_offer_reward` SET `RewardText` = 'How could this have happened to us; to me? I never thought I would die so young... and so violently...$B$BWe have tried to Detox our fallen friends, but this poison is too advanced.$B$BI cannot rest while our order''s very survival is still at stake. I am so sorry I let you down, Grandmaster $n.
' WHERE `ID` = 45404;
UPDATE `quest_offer_reward` SET `RewardText` = 'Today will not be your end, hero. The Legion threatens the Gates of Valor and without the power you wield they will surely fall.' WHERE `ID` = 45406;
UPDATE `quest_offer_reward` SET `RewardText` = 'You - I''ve seen you out on the isles.$B$BWe need to move quickly!
' WHERE `ID` = 45412;
UPDATE `quest_offer_reward` SET `RewardText` = 'No... no, no, no, no!$B$BNot good. Not good at all.' WHERE `ID` = 45413;
UPDATE `quest_offer_reward` SET `RewardText` = 'Kruul must not be allowed entrance into this world.' WHERE `ID` = 45414;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must strike before Kruul reaches his full strength, but we''re going to need help.' WHERE `ID` = 45415;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have been unfairly maligned by many. I am glad the Tirisgarde does not fall prey to petty rumors!' WHERE `ID` = 45437;
UPDATE `quest_offer_reward` SET `RewardText` = 'Whew. Celebration brew is..*hic* shtronger than I remembered it to be. *urp*
' WHERE `ID` = 45440;
UPDATE `quest_offer_reward` SET `RewardText` = 'It makes my heart glad to see our order returning to health.
' WHERE `ID` = 45442;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. That''s one less demon working against us.
' WHERE `ID` = 45449;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, you made it!
' WHERE `ID` = 45459;
UPDATE `quest_offer_reward` SET `RewardText` = 'I thank you for bringing Sigryn to me, outsider. She truly is the future of our people.$B$BThough you have already done so much, I would ask another favor of you. Please accompany Sigryn in her challenges. She has grown to trust you, and will need guidance through the trials she must face.' WHERE `ID` = 45486;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have the backing of the Dragon-Riders, but a greater rival to the throne still lives in secret.$B$BThe God-King''s son yet lives. My riders spotted him among the outcasts of Vrekt. He would be the true heir to Skovald''s throne.  $B$BThe vrykul would never follow you were he to contend your claim!' WHERE `ID` = 45523;
UPDATE `quest_offer_reward` SET `RewardText` = 'I cannot believe that I find my brother alive, only to see him fall by my own blade. $B$BHow can fate be so cruel?' WHERE `ID` = 45524;
UPDATE `quest_offer_reward` SET `RewardText` = 'Sigryn has taken the path of Skovald before her. Only, I fear she is more powerful than her father ever was. 

I fear that Sigryn''s thirst for revenge may lead to her undoing. Though truly powerful, she would be no match for Odyn.

She must be stopped before it is too late.' WHERE `ID` = 45525;
UPDATE `quest_offer_reward` SET `RewardText` = 'I suppose I have you to thank for saving my beloved companion.
' WHERE `ID` = 45553;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have encountered many outsiders in my time patrolling the city, but never one quite as resourceful as you.
' WHERE `ID` = 45554;
UPDATE `quest_offer_reward` SET `RewardText` = 'You continue to surprise me, outsider.
' WHERE `ID` = 45555;
UPDATE `quest_offer_reward` SET `RewardText` = 'There is no joy when a Nighthuntress falls, but it had to be done. The truth is, she died the moment she aligned herself with the Burning Legion.
' WHERE `ID` = 45557;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, you''re here. Let''s get to work.
' WHERE `ID` = 45571;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must remember our allies who have fallen on this day and in their honor, continue our fight.$B$BThe time is upon us, $n. Our riders are ready. Let us show the Burning Legion the true strength of Highmountain.' WHERE `ID` = 45572;
UPDATE `quest_offer_reward` SET `RewardText` = 'Tugar... I thought he was dead. He was a nasty Bloodtotem even before the Legion arrived.$B$BWe have to get to him.
' WHERE `ID` = 45575;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, my blade sings. Time to put this plan into action, Shadowblade.
' WHERE `ID` = 45576;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. The Soulstone''s shields should be sufficiently strengthened now.' WHERE `ID` = 45586;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was powerful fel magic. If it is true, if he is raising an army of such beasts... Thunder Totem is in peril!
' WHERE `ID` = 45587;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Felborne will respect the Tirisgarde now, do you not agree?' WHERE `ID` = 45614;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re in charge here?
' WHERE `ID` = 45652;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion cannot break the Grimtotem.
' WHERE `ID` = 45725;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done those souls a great favor. I hope they find peace.$B$BLet''s cut off these experiments at the source now.
' WHERE `ID` = 45726;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. We still have a long road ahead of us to rid this world of the Legion, but this brings us one step closer.' WHERE `ID` = 45727;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion is forcing Azeroth to bend to its will. We cannot allow this any longer!
' WHERE `ID` = 45763;
UPDATE `quest_offer_reward` SET `RewardText` = 'I provided cover as the weaker of your people retreated. They will return to the Maelstrom safely.
' WHERE `ID` = 45765;
UPDATE `quest_offer_reward` SET `RewardText` = 'It seems the Doomstone is pulsating with energy.
' WHERE `ID` = 45767;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, you''ve awoken. I have heard tale of what happened.
' WHERE `ID` = 45769;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was quite the encounter, wouldn''t you say Highlord $n? Reminds me of my glory days.$B$BNevertheless we''ll be keeping a more watchful eye on Stratholme from now on. But that''s not important right now.$B$BWe should move on to the ceremony and have you claim your prize!
' WHERE `ID` = 45770;
UPDATE `quest_offer_reward` SET `RewardText` = 'Grandmaster $n, these old bones grow weary. Our future depends on you to continue the fight against the Legion.$B$BSo long as you remain a beacon of light in the darkness, hope remains!
' WHERE `ID` = 45771;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank ye for coming so quickly, High $C. King Magni, or I suppose I should say ''The Speaker,'' thinks he''s found a hidden Titan vault!
' WHERE `ID` = 45788;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will miss Brewmaster Blanche. She taught me to follow my dreams.$B$BAnd I have always wanted to study Mistweaving...$B$BGrandmaster $n. If you will have me, I will defend you and our order from all that wish us harm.
' WHERE `ID` = 45790;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have saved Thunder Totem and we owe you yet another debt.$B$BIt''s a shame that Tugar wasn''t there. As long as he lives, we are in danger.$B$BI will do everything I can to find him, and then we will finish this... together.
' WHERE `ID` = 45796;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''ss about time you shut that demon up. Thanksss...
' WHERE `ID` = 45798;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must continue our fight.' WHERE `ID` = 45812;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m afraid our fight has only brought us so far. We must press our attack before the Legion advances beyond their stronghold within the Temple of a Thousand Lights!
' WHERE `ID` = 45838;
UPDATE `quest_offer_reward` SET `RewardText` = 'Just beyond these cliffs, the forces of the Legion are gathering for their assault. For every moment that passes their number grows.$b$bWe must strike soon before we are overwhelmed!' WHERE `ID` = 45839;
UPDATE `quest_offer_reward` SET `RewardText` = 'My apologies, $n. I hope Aviash and I did not offend you. One cannot be too careful during times like these.' WHERE `ID` = 45840;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am relieved that you have dealt with immediate threat. We barely have enough resources for the Broken Shore as it is!$B$BStill we have something for you...
' WHERE `ID` = 45841;
UPDATE `quest_offer_reward` SET `RewardText` = 'Any luck out there?' WHERE `ID` = 45843;
UPDATE `quest_offer_reward` SET `RewardText` = 'Squawk! Tethys is lame! Bad pirate! bad pirate!$B$B$n better pirate, raaaaawk! Go with you now!
' WHERE `ID` = 45848;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have sacrificed for our lands, brave $c.$B$BYour perseverance has inspired our brothers and sisters to stand against the Burning Legion.' WHERE `ID` = 45856;
UPDATE `quest_offer_reward` SET `RewardText` = 'We hope the increased power to your weapon will prove useful on the Broken Shore and beyond.' WHERE `ID` = 45861;
UPDATE `quest_offer_reward` SET `RewardText` = 'We hope the increased power to your weapon will prove useful on the Broken Shore and beyond.' WHERE `ID` = 45862;
UPDATE `quest_offer_reward` SET `RewardText` = 'We hope the increased power to your weapon will prove useful on the Broken Shore and beyond.' WHERE `ID` = 45863;
UPDATE `quest_offer_reward` SET `RewardText` = 'We hope the increased power to your weapon will prove useful on the Broken Shore and beyond.
' WHERE `ID` = 45864;
UPDATE `quest_offer_reward` SET `RewardText` = 'We hope the increased power to your weapon will prove useful on the Broken Shore and beyond.
' WHERE `ID` = 45865;
UPDATE `quest_offer_reward` SET `RewardText` = 'We hope the increased power to your weapon will prove useful on the Broken Shore and beyond.' WHERE `ID` = 45866;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your competence in these matters is greatly appreciated.
' WHERE `ID` = 45905;
UPDATE `quest_offer_reward` SET `RewardText` = 'The amount of power this Levia channeled into this portal is impressive, if unnecessary. Unfortunately, if we don''t get it stable, it''s likely to collapse and take us with it. $B$BSufficed to say, that would end your mission pretty quick.

I have to concentrate to keep this open, so I''ll need your help...' WHERE `ID` = 45916;
UPDATE `quest_offer_reward` SET `RewardText` = 'What... what is going on? $B$BWho are you?' WHERE `ID` = 45917;
UPDATE `quest_offer_reward` SET `RewardText` = 'I laughed as their infernals crumbled. They return to Azeroth, as they belong.
' WHERE `ID` = 45971;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, Archmage $n! Dalaran can defend herself once again.$b$bFor all of our sakes, let us hope that the shields keeping Kathra''natir imprisoned do not fail before we are able to find a safer solution.' WHERE `ID` = 46000;
UPDATE `quest_offer_reward` SET `RewardText` = 'Tell me, $n, are all those among your ranks as dedicated as their leader?$B$BI''ve been reluctant to trust outsiders, but you and I aren''t so different, are we? We''re both willing to go to great lengths to protect the things we care about. Our goals seem to align in that regard.$B$BI would like to lend my aid to you and your hunters, if you''ll allow it.
' WHERE `ID` = 46048;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are a foolish child. You think you have great power, but you know nothing. The Doomstone should be used for the greatness it can accomplish! It will waste away sitting in the Maelstrom.$B$BPerhaps it was a mistake coming here. Nobundo requests that the Grimtotem stay. I stay for my own reasons, not because he asked. If you need me or my warriors to earn our keep, we will oblige.$B$BBut remember your place.
' WHERE `ID` = 46057;
UPDATE `quest_offer_reward` SET `RewardText` = 'You made quick work of those demons, and I hope you do the same to many more. So long as the Legion extends their influence on our world, they will continue to corrupt our people as well.$B$BI would like to continue to work with you to end this madness. My blades are yours, Shadowblade.
' WHERE `ID` = 46058;
UPDATE `quest_offer_reward` SET `RewardText` = 'You risked your life freeing those animals from a life worse than death. I commend you, $n.
' WHERE `ID` = 46060;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings, Highlord. What can I help you with?$B$B<You explain what you need to Alard as he looks over the barding.>$B$BI see. I can certainly help you with your upgrading this, but I''ll need a few things first.
' WHERE `ID` = 46071;
UPDATE `quest_offer_reward` SET `RewardText` = 'A bit late for the warning, eh? Still, I appreciate that we haven''t been forgotten.
' WHERE `ID` = 46078;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve saved many lives this day, $C. Bradensbrook thanks you.
' WHERE `ID` = 46079;
UPDATE `quest_offer_reward` SET `RewardText` = 'We realize these spirits are misguided, but we have to care about the living more than the dead at this point.$B$BThe attacks should ease off for a while.
' WHERE `ID` = 46080;
UPDATE `quest_offer_reward` SET `RewardText` = 'I had hoped this town had found peace after what we''ve all been through. Somehow restless dead have been stirred into a fury. We need to stop it.
' WHERE `ID` = 46082;
UPDATE `quest_offer_reward` SET `RewardText` = 'You got them! Now to upgrade your barding.$B$BNever say a blacksmith can''t improve on a leatherworker''s work, I always say. I mean never. I mean... well you know what I mean.
' WHERE `ID` = 46083;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have shown the demons why they should truly fear the darkness. Now, Lord Ravenholdt has something for you from his personal collection.
' WHERE `ID` = 46089;
UPDATE `quest_offer_reward` SET `RewardText` = 'That should disorganize the assault for some time, but we must get to the bottom of this. I sensed a fel taint about those leaders, did you?
' WHERE `ID` = 46106;
UPDATE `quest_offer_reward` SET `RewardText` = 'The attacks on Bradensbrook should relent for now. We must still deal with Lord Erdris, and soon.
' WHERE `ID` = 46107;
UPDATE `quest_offer_reward` SET `RewardText` = 'Learning more about your artifact weapon will help hasten our victory over the Legion.$B$BIf you supply me with order resources, I can provide research notes on your weapon. Read them, and learn how to take greater advantage of the power you infuse into your artifact.$B$BDeath to our enemies!
' WHERE `ID` = 46108;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n! Well done indeed!$b$bThe Legion will rue the day they set their sights on the land of Stormheim.' WHERE `ID` = 46110;
UPDATE `quest_offer_reward` SET `RewardText` = 'The order resources you have provided are crucial to further empowering your weapon.$B$BHere, take these notes. Read the research and apply the knowledge you have learned.$B$BOnward to victory!
' WHERE `ID` = 46125;
UPDATE `quest_offer_reward` SET `RewardText` = 'Learning more about your artifact weapon will sure speed up our victory over the Legion, boss.$B$BIf you supply me with order resources, I can whip up research notes on your weapon. Read ''em, and in no time you''ll be taking greater advantage of the power you infuse into your artifact.$B$BLet''s do this!
' WHERE `ID` = 46129;
UPDATE `quest_offer_reward` SET `RewardText` = 'Learning more about your artifact weapon will help hasten our victory over the Legion.$B$BIf you supply me with order resources, I can provide research notes on your weapon. Read them, and learn how to take greater advantage of the power you infuse into your artifact.$B$BFor Azeroth!
' WHERE `ID` = 46130;
UPDATE `quest_offer_reward` SET `RewardText` = 'Knowledge of your artifact is the key to bending the demons to your will.$B$BIf you supply me with order resources, I can provide research notes on your weapon. Read them, Netherlord, and the power you infuse into your artifact will magnify.$B$BYour foes will quake in fear... as it should be!
' WHERE `ID` = 46131;
UPDATE `quest_offer_reward` SET `RewardText` = 'Learnin'' more about yer artifact weapon''ll help hasten our victory over tha Legion.$B$BIf ye supply me with order resources, I can provide research notes on yer weapon. Read ''em, and learn how to take greater advantage of the power ye infuse into yer artifact.$B$BFor Azeroth!
' WHERE `ID` = 46132;
UPDATE `quest_offer_reward` SET `RewardText` = 'Learning more about your artifact weapon will hasten our victory over the Legion.$B$BIf you supply me with order resources, I can provide research notes on your weapon. Read them, and learn how to take greater advantage of the power you infuse into your artifact.$B$BWe will send the Legions back to the hell that spawned them!
' WHERE `ID` = 46140;
UPDATE `quest_offer_reward` SET `RewardText` = 'Learning more about your artifact weapon will help hasten our victory over the Legion.$B$BIf you supply me with order resources, I can provide research notes on your weapon. Read them, and learn how to take greater advantage of the power you infuse into your artifact.$B$BFor Azeroth!
' WHERE `ID` = 46143;
UPDATE `quest_offer_reward` SET `RewardText` = 'Learning more about your artifact weapon will help hasten our victory over the Legion.$B$BIf you supply me with order resources, I can provide research notes on your weapon. Read these tales, for within them you will learn how to take greater advantage of the power you infuse into your artifact.$B$BIn stories, we find strength!
' WHERE `ID` = 46144;
UPDATE `quest_offer_reward` SET `RewardText` = 'Learning more about your artifact weapon will help speed us on the path to victory over the Legion.$B$BIf you supply me with order resources, I can provide research notes on your weapon. Read them, and learn how to take greater advantage of the power you infuse into your artifact.$B$BLet the wind guide your way!
' WHERE `ID` = 46147;
UPDATE `quest_offer_reward` SET `RewardText` = 'These order resources are just the ticket for juicing up your weapon''s power.$B$BHere, take these notes. I''m not a big reader myself, but in this case, it''s worth it. That artifact of yours will really get the job done.$B$BGood luck, boss!
' WHERE `ID` = 46148;
UPDATE `quest_offer_reward` SET `RewardText` = 'The order resources you have provided are crucial to further empowering your weapon.$B$BHere, take these notes. Read the research and apply the knowledge you have learned.$B$BOnward to victory!
' WHERE `ID` = 46149;
UPDATE `quest_offer_reward` SET `RewardText` = 'The order resources you have provided are crucial to further empowering your weapon.$B$BHere, take these notes. Read the dark secrets within and apply the knowledge you have learned.$B$BAll enemies will fall before us!
' WHERE `ID` = 46150;
UPDATE `quest_offer_reward` SET `RewardText` = 'The order resources ye ''ave provided be crucial ta further empowerin'' yer weapon.$B$BTake these notes. Read tha research an'' apply tha knowledge ye ''ave learned.$B$BOnward ta vict''ry!
' WHERE `ID` = 46151;
UPDATE `quest_offer_reward` SET `RewardText` = 'The order resources you have provided are crucial to further empowering your weapon.$B$BHere, take these notes. Read the research and apply the knowledge you have learned.$B$BOnward to victory!
' WHERE `ID` = 46156;
UPDATE `quest_offer_reward` SET `RewardText` = 'The order resources you have provided are crucial to further empowering your weapon.$B$BHere, take these notes. Read the research and apply the knowledge you have learned.$B$BEvery good story needs a hero!
' WHERE `ID` = 46157;
UPDATE `quest_offer_reward` SET `RewardText` = 'The order resources you have provided are crucial to further empowering your weapon.$B$BHere, take these notes. Read the research and apply the knowledge you have learned.$B$BMay the elements guide us to victory!
' WHERE `ID` = 46158;
UPDATE `quest_offer_reward` SET `RewardText` = 'Lady S''theno went down to lend a hand, but this sounds like it''s getting serious!
' WHERE `ID` = 46159;
UPDATE `quest_offer_reward` SET `RewardText` = 'So Xylem has been corrupted by shadow magic and has escaped with the Focusing Iris? This is not good.$B$BThe Kirin Tor will pool our efforts with those of his apprentici-- I mean, apprentices. We must track down the archmage before he does something drastic.$B$BWe will be in touch.
' WHERE `ID` = 46177;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have shown the demons why they should truly fear the darkness. Now, Lord Ravenholdt has something for you from his personal collection.
' WHERE `ID` = 46178;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our efforts today have prevailed over the Legion''s presence, though let us not be remiss - our journey has only just begun.' WHERE `ID` = 46182;
UPDATE `quest_offer_reward` SET `RewardText` = 'With the fall of their commander the Legion''s presence in Azsuna will be more manageable for our defenders to make headway. For your efforts, we may see the end of these attacks once and for all.
' WHERE `ID` = 46199;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am relieved that you have dealt with immediate threat. We barely have enough resources for the Broken Shore as it is!$B$BStill we have something for you...
' WHERE `ID` = 46200;
UPDATE `quest_offer_reward` SET `RewardText` = 'With the conduit destroyed, now may be our only chance.
' WHERE `ID` = 46205;
UPDATE `quest_offer_reward` SET `RewardText` = 'You brought crystals with you? Thank the Light, that''s just what we need!' WHERE `ID` = 46213;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve done so much so quickly here on the Broken Shore. Impressive, $n.
' WHERE `ID` = 46235;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our task will not be easy, but when this is over it is we who will be the true masters of Xoroth.
' WHERE `ID` = 46237;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. This Unbending Potion should shore up the Felslate enough to hold the portal''s structure, and these Chaotic Spinel crystals should focus the portal''s magic nicely.$B$BI will set the mo''arg to work posthaste.
' WHERE `ID` = 46238;
UPDATE `quest_offer_reward` SET `RewardText` = 'I sense the fel energy emanating from the core the moment you entered Dreadscar Rift. $B$BI think this will suit our needs.
' WHERE `ID` = 46239;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s... quite a bit of blood. I am impressed, $n.$B$BI really should just start stockpiling this stuff. It has so many uses!
' WHERE `ID` = 46240;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Wrathsteed is prepared for your binding, Netherlord. It will not be easy to enslave, its will is strong.$B$BI have to say, I''m a bit jealous. Never before have I seen such a ferocious beast, our disciples have it barely held in check.
' WHERE `ID` = 46243;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mephistroth is dead and the Cathedral is secured, but the lower reaches of the Tomb remain in the hands of the Legion.$b$bThis is not the outcome we wanted, but this fight is far from over, $n.$b$bDo not relent. Give the Legion no quarter, no place to hide. When we are ready, we will take the Tomb and drive them from Azeroth!' WHERE `ID` = 46244;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good on ya, mate! Not that there''s a bad choice to be made, of course, but it''s important to keep a positive attitude when surrounded by an infinite number of demons looking to kill ya.$b$bAs you gather additional supplies, come on back and I''ll see they get assigned to the fortification of your choice.$b$bPhew! That was a mouthful, right? I''d say it''s time for a pint.' WHERE `ID` = 46245;
UPDATE `quest_offer_reward` SET `RewardText` = 'A fine victory, $ct.$b$bBut do not grow complacent! Fight back against the Legion wherever they strike.' WHERE `ID` = 46247;
UPDATE `quest_offer_reward` SET `RewardText` = 'Step by step, we march closer to victory. We must not relent!$b$bOnly through courage and persistence will we stop the insidious evil that threatens the soul of this world.' WHERE `ID` = 46248;
UPDATE `quest_offer_reward` SET `RewardText` = 'It has been pointed out to me that I can, on occasion, get a bit carried away.$b$bThis... <clears throat> might possibly have been one of those times.$b$bA single Nethershard will suffice for my purposes. I''m certain you can put the rest to good use.$b$bLet''s not speak of this again.' WHERE `ID` = 46251;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have witnessed the destruction the Doomstone can wreak firsthand. You are a trusted warden of Azeroth, but even in your hands the power caused chaos and panic amongst your people. Imagine it in the control of someone with ill intent...$B$BWe cannot let that happen.$B$BWe discussed what to do with this artifact at length while we waited for you to awaken. We considered giving it a new home in one of the elemental planes, but each one provided its own danger.$B$BThere is no safer place for it than here.
' WHERE `ID` = 46258;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your quick blades have proven your worth to the Illidari yet again, Slayer $n. We will begin the repairs to the Fel Hammer immediately. $B$BWe cannot allow the Legion to catch us with our pants down again!
' WHERE `ID` = 46266;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have helped me more than I can say, $n. For that, you will always have my thanks.
' WHERE `ID` = 46282;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''s what I''m talkin'' about, mate!$b$bOi! Time to get to work.' WHERE `ID` = 46286;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must not forget that this is a temporary measure. I cannot overstate the devastation that will ensue if Kathra''natir escapes... $b$bStill, thanks to you, Dalaran''s teeth are sharpened once more. Well done, Archmage $n!' WHERE `ID` = 46290;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion will pay for what we''ve lost today. We escaped with as many of us as we could, but too many died in vain, trying to protect the Shrine and the Idol of Aviana, which was lost anyway, thanks to that demon scum, Shadegrove.
' WHERE `ID` = 46318;
UPDATE `quest_offer_reward` SET `RewardText` = 'Finally... my time to shine. Let''s do this right.
' WHERE `ID` = 46322;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes... the gunpowder. It is the key to my plan!
' WHERE `ID` = 46323;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome back, Shadowblade. I assume you''ve retrieved the gunpowder?
' WHERE `ID` = 46326;
UPDATE `quest_offer_reward` SET `RewardText` = 'You are lucky that Modera contacted me for assistance. 

Agatha is beyond you, $c. She is beyond any of us.' WHERE `ID` = 46327;
UPDATE `quest_offer_reward` SET `RewardText` = 'Never would I have thought an adult fel bat could be tamed, but your efforts seemed to have prove otherwise. This is a promising revelation for us.$B$BBut for now, let all see what you have accomplished.
' WHERE `ID` = 46334;
UPDATE `quest_offer_reward` SET `RewardText` = 'So word has gotten out about Ryanna already? Ha!' WHERE `ID` = 46338;
UPDATE `quest_offer_reward` SET `RewardText` = 'This appears to be some sort of attunement crystal. Perfect.' WHERE `ID` = 46339;
UPDATE `quest_offer_reward` SET `RewardText` = 'So the daughter of Skovald followed in her father''s footsteps? A pity, but it may have been inevitable. I believe this may be the "fall" the scrolls mentioned.

If this is true, there may still be hope! I will work on a way to get us into the Halls of Valor to pursue this Sigryn. I will be in touch when we find a way.

In the meantime, you have done a great service to bring her this far. I would not let that go unrewarded.' WHERE `ID` = 46340;
UPDATE `quest_offer_reward` SET `RewardText` = 'A senseless loss of life, and for what?$B$B<Master Bu looks heavily at the portal and shakes his head.>
' WHERE `ID` = 46342;
UPDATE `quest_offer_reward` SET `RewardText` = 'These old bones just need a little rest. But we appear to be one step further on our journey.$B$BThat grummle over there looks like he could use some assistance. Why don''t you talk to him while I get some rest?
' WHERE `ID` = 46343;
UPDATE `quest_offer_reward` SET `RewardText` = 'Smelly has a new idea! Leave his pack on fire!$B$BNothing else bad happen while pack on fire! Pack on fire IS Smelly''s new luckydo! You keep old one.$B$BOh, you looking for big tiger? Smelly saw big glowy tiger. Went towards monastery. Smelly was helpful?
' WHERE `ID` = 46344;
UPDATE `quest_offer_reward` SET `RewardText` = 'I think we have stumbled upon their headquarters. Be careful in here!' WHERE `ID` = 46345;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Shado-pan appear greatful, Grandmaster.$B$BShall we cont... what is that black residue on your foot?
' WHERE `ID` = 46347;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings. It is not every day that a Grandmaster $C comes to visit me. How can I be of service?
' WHERE `ID` = 46348;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you. Allow me to search for answers for you.
' WHERE `ID` = 46349;
UPDATE `quest_offer_reward` SET `RewardText` = 'It will be my honor to carry you on the ceremonial path from this shrine to the temple, as I have done for the Grandmasters before you.
' WHERE `ID` = 46350;
UPDATE `quest_offer_reward` SET `RewardText` = 'What is this?$b$bThis is not just any old shield generator - it is almost... a sentient entity...$b$bAnd it is very eager for a job to do. Yes, I think it will be quite content to work with us.' WHERE `ID` = 46351;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming, Grandmaster.
' WHERE `ID` = 46353;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, look here! You went and got that treasure! Hey... You still got a spider on your shoulder.$B$BLet''s see what fantastic treasure you brought me... This is it? This is worthless! Here you keep it.$B$BTough break, kid. Keep at it.' WHERE `ID` = 46499;
UPDATE `quest_offer_reward` SET `RewardText` = 'You found a key in a chest? Nothing else?$B$BI''m guessing the last guy took all the goods, then accidentally locked the key in the chest. So, you just found a key to a chest that you''ve already looted. Fantastic work... And people say I suck at this job.' WHERE `ID` = 46501;
UPDATE `quest_offer_reward` SET `RewardText` = 'Did you bother to read the label on this potion? I''m going to assume, no. You may find some sucker who will pay you for it.$B$BBetter luck next time kid.' WHERE `ID` = 46509;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s... Wet. This thing is most likely worthless now.$B$BIs there a good piece of treasure on this cursed island? I may not be the brightest tool in the bag, but I''m starting to think this place doesn''t really fit my "chance of death versus treasure" ratio.' WHERE `ID` = 46510;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is it? You sure you didn''t find anything else? Like a giant pile of gold on top of a statue made of diamonds which was holding a scroll listing the combination to the vault in Ironforge? That would have been pretty sweet.$B$BOh well. I can make this into a paper weight or throw it at a squirrel.$B$BCome back tomorrow, I''ll have another job for you.' WHERE `ID` = 46511;
UPDATE `quest_offer_reward` SET `RewardText` = 'Looks like we hit the motherlode! Now all we need is a key... Huh. Why don''t you go work on getting some keys for these chests and I''ll hang out with goofy-nose here.
' WHERE `ID` = 46666;
UPDATE `quest_offer_reward` SET `RewardText` = 'Revenge is so sweet. Thank you.' WHERE `ID` = 46705;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our forces are assembled. We are ready to begin.' WHERE `ID` = 46730;
UPDATE `quest_offer_reward` SET `RewardText` = 'Turalyon yet lives! Perhaps there is still hope after all.' WHERE `ID` = 46732;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mephistroth is on the run, and we have a foothold here at Deliverance Point.$b$bA good start, I''d say, though we still have much to do.' WHERE `ID` = 46734;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings, little hero.

The mighty Odyn has proclaimed that you should receive these gifts of war. At every turn you continue to prove your valor and your efforts to aid the Valarjar have not gone unnoticed. 

For the Valarjar! For Odyn! For $n!' WHERE `ID` = 46746;
UPDATE `quest_offer_reward` SET `RewardText` = 'Outlander, I have some supplies for you. These goods are yours, earned by your continued efforts to our forces here in Suramar.

I shall set aside similar treasures should you choose to aid our people more.

You have my deepest thanks.' WHERE `ID` = 46748;
UPDATE `quest_offer_reward` SET `RewardText` = 'This scroll, fascinating... this confirms our concerns about indirect Legion threats. We must return to Dalaran, $n!' WHERE `ID` = 46765;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fine work. It''s important to keep powerful treasures out of demon hands.$b$bThere are more ways to undermine the Legion''s agenda than simply killing demons... although there''s a lot to be said for good old-fashioned violence.' WHERE `ID` = 46769;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our grand efforts have resulted in a boon which all can leverage in the coming days.
' WHERE `ID` = 46772;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our grand efforts have resulted in a boon which all can leverage in the coming days.
' WHERE `ID` = 46773;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our grand efforts have resulted in a boon which all can leverage in the coming days.
' WHERE `ID` = 46774;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our power grows.' WHERE `ID` = 46782;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming, Farseer.
' WHERE `ID` = 46791;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that the council is reunited, the plane of air shall flow as one again!$B$BI believe Windlord Thunderaan has a reward waiting for you.
' WHERE `ID` = 46792;
UPDATE `quest_offer_reward` SET `RewardText` = 'Greetings outlander, liberator, Huntmaster, friend.$B$B.Our gratitude goes beyond anything mere words can define.$B$BTake these trophies as a token of our gratitude and a share in the spoils of war. The more you aid us, the more we can provide you.
' WHERE `ID` = 46799;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is as if the battle never ceased. How long have they suffered like this?' WHERE `ID` = 46815;
UPDATE `quest_offer_reward` SET `RewardText` = 'Lothraxion is an old friend, and a noble warrior. We are fortunate to have him among us.' WHERE `ID` = 46816;
UPDATE `quest_offer_reward` SET `RewardText` = 'The tide is turning. We must press forward.' WHERE `ID` = 46818;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve been discussing your recent success, $n. We walk the shadows, and that often goes taken for granted. But without us, the Armies of Legionfall would have a great many more powerful demons to deal with.$B$BWe do not need the fame. We reap the rewards.
' WHERE `ID` = 46827;
UPDATE `quest_offer_reward` SET `RewardText` = 'Chambers sent you? He can down a tankard with the best of ''em, I''ll give him that. But if he says I owe him anything, he''s a liar!$b$bDon''t you worry, my drakes and I will hold the point here. But more of this shore will need to be secured before your campaign can find victory.' WHERE `ID` = 46832;
UPDATE `quest_offer_reward` SET `RewardText` = 'I cannot right every wrong that happened here, but this is a comfort nonetheless.$b$bThank you, $n.' WHERE `ID` = 46834;
UPDATE `quest_offer_reward` SET `RewardText` = 'So it begins.' WHERE `ID` = 46839;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hatuun''s people will greatly appreciate what you''ve done for them.' WHERE `ID` = 46840;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that their lords have been reduced to ash, we may strike at the heart of their power.' WHERE `ID` = 46841;
UPDATE `quest_offer_reward` SET `RewardText` = 'This victory is only the first link in a long chain, $ct.' WHERE `ID` = 46842;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Illidari don''t waste time on congratulations. There is more to do, and you''re the one to do it.$B$BGet a move on.' WHERE `ID` = 46845;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, I can now provide you with a boon that will grant you a benefit while the Command Center is activated.
' WHERE `ID` = 46904;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion uses these beacons to communicate with their fleet up above. If we were to find more of these...' WHERE `ID` = 46935;
UPDATE `quest_offer_reward` SET `RewardText` = 'The way forward is clear, and we have the Army of the Light at our side.' WHERE `ID` = 46941;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, I can now provide you with a boon that will grant you a benefit while the Command Center is activated.
' WHERE `ID` = 46999;
UPDATE `quest_offer_reward` SET `RewardText` = 'A bit late for the warning, eh? Still, I appreciate that we haven''t been forgotten.
' WHERE `ID` = 47004;
UPDATE `quest_offer_reward` SET `RewardText` = 'A bit late for the warning, eh? Still, I appreciate that we haven''t been forgotten.
' WHERE `ID` = 47006;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, I can now provide you with a boon that will grant you a benefit while the Mage Tower is activated.
' WHERE `ID` = 47007;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, I can now provide you with a boon that will grant you a benefit while the Mage Tower is activated.
' WHERE `ID` = 47010;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, I can now provide you with a boon that will grant you a benefit while the Nether Disruptor is activated.
' WHERE `ID` = 47012;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, I can now provide you with a boon that will grant you a benefit while the Nether Disruptor is activated.
' WHERE `ID` = 47015;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, I can now provide you with a boon that will grant you a benefit while the Nether Disruptor is activated.
' WHERE `ID` = 47016;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming. I am glad you are treating this threat seriously.
' WHERE `ID` = 47018;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming. I am glad you are treating this threat seriously.
' WHERE `ID` = 47020;
UPDATE `quest_offer_reward` SET `RewardText` = 'You - I''ve seen you out on the isles.$B$BWe need to move quickly!
' WHERE `ID` = 47022;
UPDATE `quest_offer_reward` SET `RewardText` = 'You - I''ve seen you out on the isles.$B$BWe need to move quickly!' WHERE `ID` = 47023;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming. I have something I''d like to show you.' WHERE `ID` = 47027;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming. I have something I''d like to show you.' WHERE `ID` = 47030;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming. I have something I''d like to show you.
' WHERE `ID` = 47031;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming. I have something I''d like to show you.
' WHERE `ID` = 47033;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming. I have something I''d like to show you.' WHERE `ID` = 47034;
UPDATE `quest_offer_reward` SET `RewardText` = 'You come from the Kirin Tor? So you''ll help me find my brother?
' WHERE `ID` = 47041;
UPDATE `quest_offer_reward` SET `RewardText` = 'You come from the Kirin Tor? So you''ll help me find my brother?
' WHERE `ID` = 47042;
UPDATE `quest_offer_reward` SET `RewardText` = 'So someone stole the Focusing Iris and you suspect Xylem might be the culprit? You may be right. $B$BIt is no secret that the archmage has been seeking artifacts of late. However, after the discovery of an ancient grimoire in the Legashi ruins, Xylem has become... unstable. I fear the grimoire may be stealing his mind.$B$BI can help you gain audience with the archmage. With any luck, you can reclaim the Iris peacefully.
' WHERE `ID` = 47043;
UPDATE `quest_offer_reward` SET `RewardText` = 'So someone stole the Focusing Iris and you suspect Xylem might be the culprit? You may be right. $B$BIt is no secret that the archmage has been seeking artifacts of late. However, after the discovery of an ancient grimoire in the Legashi ruins, Xylem has become... unstable. I fear the grimoire may be stealing his mind.$B$BI can help you gain audience with the archmage. With any luck, you can reclaim the Iris peacefully.
' WHERE `ID` = 47046;
UPDATE `quest_offer_reward` SET `RewardText` = 'So someone stole the Focusing Iris and you suspect Xylem might be the culprit? You may be right. $B$BIt is no secret that the archmage has been seeking artifacts of late. However, after the discovery of an ancient grimoire in the Legashi ruins, Xylem has become... unstable. I fear the grimoire may be stealing his mind.$B$BI can help you gain audience with the archmage. With any luck, you can reclaim the Iris peacefully.
' WHERE `ID` = 47047;
UPDATE `quest_offer_reward` SET `RewardText` = 'So someone stole the Focusing Iris and you suspect Xylem might be the culprit? You may be right. $B$BIt is no secret that the archmage has been seeking artifacts of late. However, after the discovery of an ancient grimoire in the Legashi ruins, Xylem has become... unstable. I fear the grimoire may be stealing his mind.$B$BI can help you gain audience with the archmage. With any luck, you can reclaim the Iris peacefully.
' WHERE `ID` = 47048;
UPDATE `quest_offer_reward` SET `RewardText` = 'So it seems that Levia has fallen under the spell of a succubus'' seduction. I fear her time alone as an outcast must have left her vulnerable to such tactics. I cannot help but feel some guilt for her turning down this path.$B$BIn any case, Levia is in great danger. She must be found!
' WHERE `ID` = 47056;
UPDATE `quest_offer_reward` SET `RewardText` = 'So it seems that Levia has fallen under the spell of a succubus'' seduction. I fear her time alone as an outcast must have left her vulnerable to such tactics. I cannot help but feel some guilt for her turning down this path.$B$BIn any case, Levia is in great danger. She must be found!
' WHERE `ID` = 47058;
UPDATE `quest_offer_reward` SET `RewardText` = 'This tome is fascinating! It appears to seek out any and all knowledge that it does not already possess.$B$BI''d wager an experienced researcher could direct it to locate specific knowledge.$B$BHmm, that gives me an idea...
' WHERE `ID` = 47067;
UPDATE `quest_offer_reward` SET `RewardText` = 'What have you brought today, Battlelord?$B$B<Fjornson examines the ancient tome.>$B$BThis book... it changes everything!
' WHERE `ID` = 47072;
UPDATE `quest_offer_reward` SET `RewardText` = 'What have you brought today, Slayer?$B$B<Vahu examines the ancient tome.>$B$BThis book... it changes everything!
' WHERE `ID` = 47078;
UPDATE `quest_offer_reward` SET `RewardText` = 'What have you brought today, Shadowblade?$B$B<Filius examines the ancient tome.>$B$BThis book... it changes everything!
' WHERE `ID` = 47079;
UPDATE `quest_offer_reward` SET `RewardText` = 'What is this... a sermon? Fascinating.' WHERE `ID` = 47101;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve found one of our scouting reports? It was overdue, and I feared it had been intercepted by the enemy.$b$b<The captain looks over the letter.>$b$bYes, this is what I''ve been expecting. The Legion is planning something and this is the breakthrough we''ve been looking for!' WHERE `ID` = 47102;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. A peaceful rest is all we have to offer those who have made the ultimate sacrifice for the Alliance... for Azeroth.
' WHERE `ID` = 47112;
UPDATE `quest_offer_reward` SET `RewardText` = 'Another powerful ally recruited to our cause!$b$bYou have bolstered our strength against the Legion once more, $n.' WHERE `ID` = 47137;
UPDATE `quest_offer_reward` SET `RewardText` = 'I can feel the Void''s influence retreating. Perhaps now we can find out what happened here.' WHERE `ID` = 47180;
UPDATE `quest_offer_reward` SET `RewardText` = 'I should have seen this coming.' WHERE `ID` = 47183;
UPDATE `quest_offer_reward` SET `RewardText` = 'We buy time but nothing more.' WHERE `ID` = 47217;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is good to know we can share a common goal. Perhaps I will find some use for your kind yet.' WHERE `ID` = 47218;
UPDATE `quest_offer_reward` SET `RewardText` = 'What is it you bring, $n?$b$b<Velen peers down upon the cold, dense object.>$b$bIntriguing...' WHERE `ID` = 47220;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''m glad you were among those called for the expedition to Argus. There will be plenty of fighting ahead.
' WHERE `ID` = 47221;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank the Light you have arrived.' WHERE `ID` = 47223;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is grave news indeed. It would be wise to follow Alleria''s lead from here.' WHERE `ID` = 47238;
UPDATE `quest_offer_reward` SET `RewardText` = 'Light''s Judgment will now fire on your command when you use the Matrix Uplink. $b$bPerhaps you will find more objects that we can link into the Matrix on your travels. I have routed enough energy to that part of the Core to handle anything that you can link into it. $b$bGo well, my friend.' WHERE `ID` = 47287;
UPDATE `quest_offer_reward` SET `RewardText` = 'I worried for L''ura, but this is... unthinkable.$b$bHow she must have suffered...' WHERE `ID` = 47416;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''ve secured a foothold. Good.$b$bNow we take the fight to them!' WHERE `ID` = 47431;
UPDATE `quest_offer_reward` SET `RewardText` = 'We may be grounded, but that does not mean they have to rule the skies!' WHERE `ID` = 47508;
UPDATE `quest_offer_reward` SET `RewardText` = 'You fought well. The Light shines brighter, thanks to your efforts.' WHERE `ID` = 47541;
UPDATE `quest_offer_reward` SET `RewardText` = 'Skara and Brae gave their lives to get us this information and the codebook. Their sacrifice will not be forgotten.$b$bNow, let us decipher the orders and see what the Legion is up to.' WHERE `ID` = 47554;
UPDATE `quest_offer_reward` SET `RewardText` = 'It seems we underestimated the Legion''s cunning.' WHERE `ID` = 47627;
UPDATE `quest_offer_reward` SET `RewardText` = 'This must be it.' WHERE `ID` = 47641;
UPDATE `quest_offer_reward` SET `RewardText` = 'Light be praised! This was a dark day, and many lives were lost. $b$bBut the Army endures. The Light Mother''s prophecy will be fulfilled.$b$bAll is as it was meant to be.' WHERE `ID` = 47652;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is done. My heart mourns the loss of L''ura, but at least you brought her peace.$b$bOnce the Crown is in place, the Vindicaar will stand against the Legion''s vile assault. Antorus will fall!' WHERE `ID` = 47654;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh. You were successful.$b$bSurprising.' WHERE `ID` = 47685;
UPDATE `quest_offer_reward` SET `RewardText` = 'This place has its share of secrets. Thankfully, I know enough of them to get us started.' WHERE `ID` = 47686;
UPDATE `quest_offer_reward` SET `RewardText` = 'I had not imagined the final product to be so... sticky.$b$b<Y''mera wipes her hands on her robes.>$b$bIt will do.' WHERE `ID` = 47688;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have never felt power like this before...$b$b<Y''mera handles the shard cautiously.>$b$bWe should get this to Velen as soon as we can.' WHERE `ID` = 47690;
UPDATE `quest_offer_reward` SET `RewardText` = 'You came upon me in a moment of reflection.$b$b<Velen peers at you with a tired expression.>$b$bThere is no time for such sentiment. We must press on.' WHERE `ID` = 47691;
UPDATE `quest_offer_reward` SET `RewardText` = 'I did not expect this of Xe''ra. Nor could I have foreseen Illidan''s reaction.$b$bWe must ensure these events do not crush the spirits of our allies.' WHERE `ID` = 47743;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent. The path is clear.' WHERE `ID` = 47754;
UPDATE `quest_offer_reward` SET `RewardText` = 'We''re under too much pressure here. And it''s so close to us...' WHERE `ID` = 47771;
UPDATE `quest_offer_reward` SET `RewardText` = 'I knew you would be among those called to fight. It will be an honor to fight by your side.
' WHERE `ID` = 47835;
UPDATE `quest_offer_reward` SET `RewardText` = 'If I have learned anything about the Legion, it is that we have no other option but to fight back.$b$bIt was a pleasure to have you at my side.' WHERE `ID` = 47854;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is done. This one wrong, of many, is finally set to rights.' WHERE `ID` = 47856;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, excellent. The conduits are back online.$b$bThe construct however is proving a little more difficult to awaken than I had hoped.' WHERE `ID` = 47882;
UPDATE `quest_offer_reward` SET `RewardText` = 'Prepare yourself, stranger.' WHERE `ID` = 47883;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank ye fer joinin'' me, $Glad:lass;. There''s somethin'' ye have to see.' WHERE `ID` = 47889;
UPDATE `quest_offer_reward` SET `RewardText` = 'I don''t know how Sargeras managed to raise Aggramar, but it''s bad news for us, believe you me.' WHERE `ID` = 47890;
UPDATE `quest_offer_reward` SET `RewardText` = 'What did Magni have to show you?' WHERE `ID` = 47891;
UPDATE `quest_offer_reward` SET `RewardText` = 'With these new steeds our forces stand a chance.' WHERE `ID` = 47967;
UPDATE `quest_offer_reward` SET `RewardText` = 'Perfect! Thank you, $n.' WHERE `ID` = 47986;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you, $n. Your actions deny the Legion power and grant the dead the peace they deserve.' WHERE `ID` = 47987;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that their forces are in disarray, let us proceed.' WHERE `ID` = 47988;
UPDATE `quest_offer_reward` SET `RewardText` = 'No war is won by a single act, but without the spires protecting them the rest of the hold will fall as well.' WHERE `ID` = 47991;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well fought! Now for the commander.' WHERE `ID` = 47992;
UPDATE `quest_offer_reward` SET `RewardText` = 'By the Light...' WHERE `ID` = 47993;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that it has been thoroughly tested, I will direct our artificers to energize the warframe once more so that you may call it into battle. If you wish, you may select it at the Matrix Core at your leisure.' WHERE `ID` = 47994;
UPDATE `quest_offer_reward` SET `RewardText` = 'Empyrium requires a precise strike to yield the best results. Aim your pick at the brightest bits of the ore, which also happen to be very small, hence the precision.$B$BThis will break the deposit apart faster and you''ll be able to harvest ore quicker.
' WHERE `ID` = 48034;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ebenhorn hat uralte Zauberschutze erwähnt, die am Hochberg aufrechterhalten werden müssen. Diese Zauberschutze sollen eine große Finsternis zurückhalten.$b$bDas steht vielleicht im Zusammenhang mit der bösen Macht, die sich seiner bemächtigt hat.$b$bWir müssen darauf hoffen, dass uns Geistwandler Grauhimmel mehr darüber erzählen kann.' WHERE `ID` = 48079;
UPDATE `quest_offer_reward` SET `RewardText` = 'We are that much closer to restoring the Crown of the Triumvirate to its former glory.' WHERE `ID` = 48107;
UPDATE `quest_offer_reward` SET `RewardText` = 'The next ward is nearby. I can sense it.
' WHERE `ID` = 48185;
UPDATE `quest_offer_reward` SET `RewardText` = 'Do you sense it, $n? Such strength... such courage.$B$BThe echo of Huln Highmountain''s spirit is all around us.
' WHERE `ID` = 48190;
UPDATE `quest_offer_reward` SET `RewardText` = 'I never imagined such destruction... such horror.' WHERE `ID` = 48199;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good. From here we can quickly access and reinforce each of the encampments.' WHERE `ID` = 48200;
UPDATE `quest_offer_reward` SET `RewardText` = 'We have a foothold here... for now.$b$bI am unsure how long it could hold out against a sustained assault.' WHERE `ID` = 48201;
UPDATE `quest_offer_reward` SET `RewardText` = 'So many demons. So much work to do.' WHERE `ID` = 48202;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, yes. Combined, these clusters should provide just enough power for me to fuse the key fragments back together.
' WHERE `ID` = 48261;
UPDATE `quest_offer_reward` SET `RewardText` = 'Nice work, Huntmaster. Those ethereals stood no chance against you.$B$BNow that we have the fragments, I can prepare them for reforging.
' WHERE `ID` = 48271;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Pantheon has been dead for thousands of years... I fear this plan has been in the works for a very, very long time.' WHERE `ID` = 48272;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank ye fer joinin'' me, $Glad:lass;. There''s somethin'' ye have to see.' WHERE `ID` = 48273;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ye came just in the nick of time.' WHERE `ID` = 48277;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our answer lies in the Legion''s own portal network in the heart of Antorus.' WHERE `ID` = 48280;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, alchemist. We needed these potions badly.
' WHERE `ID` = 48318;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, alchemist. We needed these potions badly.
' WHERE `ID` = 48323;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, herbalist. We needed this astral glory badly.
' WHERE `ID` = 48337;
UPDATE `quest_offer_reward` SET `RewardText` = 'There is no room for error here, $n.' WHERE `ID` = 48344;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, miner. We needed this empyrium badly.
' WHERE `ID` = 48349;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, skinner. We needed this fiendish leather badly.
' WHERE `ID` = 48359;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, jewelcrafter. We needed these florid malachites badly.
' WHERE `ID` = 48363;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, jewelcrafter. We needed this hesselian badly.
' WHERE `ID` = 48364;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for assisting us, tailor. We needed this lightweave cloth badly.
' WHERE `ID` = 48373;
UPDATE `quest_offer_reward` SET `RewardText` = 'I cannot put into words how much you have done for us this day, or how grateful I am to have you as an ally.$B$BYou have our thanks, hero. You have MY thanks.$B$BI owe you a great debt for this.
' WHERE `ID` = 48403;
UPDATE `quest_offer_reward` SET `RewardText` = 'It seems we have secured a new ally. You have done well.$B$BThe Highmountain tauren are famed for their prowess in battle. I look forward to the pummeling they will unleash upon the Alliance.
' WHERE `ID` = 48433;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am myself again, $n.$B$BYou and Graysky have freed me from the grasp of the Old Gods. Had I remained in that state for much longer, I would have been lost.
' WHERE `ID` = 48434;
UPDATE `quest_offer_reward` SET `RewardText` = 'We must act quickly!' WHERE `ID` = 48440;
UPDATE `quest_offer_reward` SET `RewardText` = 'You have recovered our supplies. As promised, we will aid your forces on Argus.' WHERE `ID` = 48441;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve been a great asset to my wranglers here. Please take this as a token of our gratitude.
' WHERE `ID` = 48453;
UPDATE `quest_offer_reward` SET `RewardText` = 'Keeping balance within the forest ensures its longevity.' WHERE `ID` = 48455;
UPDATE `quest_offer_reward` SET `RewardText` = 'So many Legion worlds are ripe for the taking...' WHERE `ID` = 48461;
UPDATE `quest_offer_reward` SET `RewardText` = 'A cowled figure... and it did not attack you?$B$BMost curious.' WHERE `ID` = 48483;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion''s defeat is at hand.' WHERE `ID` = 48513;
UPDATE `quest_offer_reward` SET `RewardText` = 'An important first step, $n.$b$bIf we can bring balance to the Netherlight Crucible, I believe it will make your weapon even more powerful.' WHERE `ID` = 48559;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, yes. Balance is key, just as the Prophet said.' WHERE `ID` = 48560;
UPDATE `quest_offer_reward` SET `RewardText` = 'Their commanders fall before us!' WHERE `ID` = 48605;
UPDATE `quest_offer_reward` SET `RewardText` = 'A good start, hero. There is plenty more where that came from.' WHERE `ID` = 48799;
UPDATE `quest_offer_reward` SET `RewardText` = 'Success! It is nice to know I haven''t lost my touch.$B$BHere you go, $n; it is as good as new.
' WHERE `ID` = 48803;
UPDATE `quest_offer_reward` SET `RewardText` = 'I am glad to hear Fareeya is well.$B$BShe is right... this is a fragment of the armory key I forged her so long ago.
' WHERE `ID` = 48864;
UPDATE `quest_offer_reward` SET `RewardText` = 'After so many years... so many sacrifices... victory is finally within our grasp.' WHERE `ID` = 49014;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah yes, I sense the Light within these fragments. Do not lose hope, $n!' WHERE `ID` = 49143;
UPDATE `quest_offer_reward` SET `RewardText` = 'As your weapon increases in strength we will be able to infuse it with even greater power, but its new strength should be more than enough for now.
' WHERE `ID` = 49224;
UPDATE `quest_offer_reward` SET `RewardText` = 'T''paartos is... enthusiastic. He means well, and he has a fire within him that few even among the Lightforged possess. Thank you for keeping him safe, $r.' WHERE `ID` = 49266;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Legion''s defeat is at hand.' WHERE `ID` = 49293;
UPDATE `quest_offer_reward` SET `RewardText` = 'Das kam nicht unbedingt unerwartet.' WHERE `ID` = 49354;
UPDATE `quest_offer_reward` SET `RewardText` = 'As you''ve no doubt learned, Primal Sargerite is a precious material which yields great power when infused with items. In our fight against the Legion, we need all the power we can get our hands on.$b$bBring me any Primal Sargerite you find and I will trade with you what I can.' WHERE `ID` = 49445;
UPDATE `quest_offer_reward` SET `RewardText` = 'Gut, wir sind alle da. Unsere Gäste sollten in Kürze eintreffen.' WHERE `ID` = 49613;
UPDATE `quest_offer_reward` SET `RewardText` = 'Welcome, $n. You are about to bear witness to a ritual none but members of the Army of the Light have seen.' WHERE `ID` = 49698;
UPDATE `quest_offer_reward` SET `RewardText` = 'Gute Arbeit, $n. Meine Leute werden ab hier übernehmen.' WHERE `ID` = 49756;
UPDATE `quest_offer_reward` SET `RewardText` = 'Umbric''s methods are a bit cavalier, but he seems competent. We must get to him before things become too dangerous.' WHERE `ID` = 49787;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for coming, $n. Finding new allies isn''t easy, but your support will help.' WHERE `ID` = 49929;
UPDATE `quest_offer_reward` SET `RewardText` = 'Die Stadt Suramar bietet einen prächtigen Anblick. Ich hoffe Silbermond stößt bei ihnen nicht auf Enttäuschung.' WHERE `ID` = 49973;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well met, $n. It''s good to have someone of your renown here with us in Silithus.
' WHERE `ID` = 49981;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great work, $n! With the shredders sabotaged, the Bilgewater Cartel mining operation will grind to a halt!
' WHERE `ID` = 50046;
UPDATE `quest_offer_reward` SET `RewardText` = 'I''ve never seen anythin'' like this before... I''ll get to work examinin'' it at once!
' WHERE `ID` = 50047;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank you for delivering Khadgar''s letter ta me. I''m goin'' ta need some time ta consider his words. If what he says is correct, we may be able ta save Azeroth... but at a great cost.
' WHERE `ID` = 50049;
UPDATE `quest_offer_reward` SET `RewardText` = 'I love the tale of the Lightforged draenei. Dedicated to the Light and eradicating all evil!

It is important to remember they are no strangers to weakness. T''paartos faced his weakness in order to ascend. 

We must remember that we all have our flaws, but together we can overcome them.' WHERE `ID` = 50071;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh! Look at these big, beautiful brains! I can''t wait to dig in... thanks for your help, $n! You can stay and watch if you want, but it may get a bit messy!
' WHERE `ID` = 50226;
UPDATE `quest_offer_reward` SET `RewardText` = 'These are just some of the allies I''ve discovered. I''m sure there are more out there.

I''m also happy to tell you about how our current allies joined the Alliance. 

It''s always important to remember the past and the bonds we''ve made.' WHERE `ID` = 50239;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have come to value your wisdom, $n. The choice you make today will strengthen the Horde.
' WHERE `ID` = 50242;
UPDATE `quest_offer_reward` SET `RewardText` = 'At last you have arrived, $n. The very future of the Alliance may depend on what I am about to tell you...
' WHERE `ID` = 50371;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''re here to collect the samples? Let''s get started!
' WHERE `ID` = 50372;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s good to see you, $n. I wish that I were here under more pleasant circumstances...
' WHERE `ID` = 50373;
UPDATE `quest_offer_reward` SET `RewardText` = 'The blood of Azeroth? I''ll make sure this news reaches Stormwind, but I must continue the operation until I am ordered otherwise.
' WHERE `ID` = 50374;
UPDATE `quest_offer_reward` SET `RewardText` = 'Spectacular! Marvelous! At last, I understand fully, and the titans themselves speak to me! They have shown me how to use the essences to craft the finest armors the world has ever seen, though I think the results may be... somewhat unpredictable.$b$b<Vridiel beams with pride.>$b$bWell, what are you waiting for? Bring me as many Wakening Essence as you can find!' WHERE `ID` = 50432;
UPDATE `quest_request_items` SET `CompletionText` = 'Where did I put my monocle?! Conacher is that you?' WHERE `ID` = 26505;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you gotten my ingredients?' WHERE `ID` = 26506;
UPDATE `quest_request_items` SET `CompletionText` = 'Hi.  I miss my necklace.  My daddy got it for me.  Daddy says that there are monsters in the lake.  Did you beat up any monsters?' WHERE `ID` = 26508;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you recovered the gnomecorder?' WHERE `ID` = 26510;
UPDATE `quest_request_items` SET `CompletionText` = 'With the Sealed Reliquary of Purity in our possession, it will be possible not only to remove a corrupting threat from the world but also to study it under our judicious watch.  Perhaps we can even devise new means to combat the taint of corruption that ever threatens Azeroth.' WHERE `ID` = 27103;
UPDATE `quest_request_items` SET `CompletionText` = 'It''s good to see you back, $n.' WHERE `ID` = 27166;
UPDATE `quest_request_items` SET `CompletionText` = 'We''ve traveled a long way.  Anything you can spare would be appreciated.' WHERE `ID` = 27167;
UPDATE `quest_request_items` SET `CompletionText` = 'What happened at Uther''s Tomb, $n?' WHERE `ID` = 27171;
UPDATE `quest_request_items` SET `CompletionText` = 'Did Valorfist send you?  He doesn''t know when to let up, does he?' WHERE `ID` = 27172;
UPDATE `quest_request_items` SET `CompletionText` = 'Where are the cores, lad? By Muradin''s Beard, where are the bloody cores?$B$B<Kand takes a deep breath.>$B$BSorry about that. Have you been able to obtain the cores?
' WHERE `ID` = 27673;
UPDATE `quest_request_items` SET `CompletionText` = 'A couple bodiless spirits aren''t going to best you, are they?' WHERE `ID` = 27988;
UPDATE `quest_request_items` SET `CompletionText` = 'You manage to get your hands on them supplies, $gpal:toots;?' WHERE `ID` = 31112;
UPDATE `quest_request_items` SET `CompletionText` = 'Look at this shot? I could shoot here all day! Did you get those parts yet?
' WHERE `ID` = 32470;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the shards, $n?' WHERE `ID` = 33066;
UPDATE `quest_request_items` SET `CompletionText` = 'It''s all downhill from here, dearie.' WHERE `ID` = 33077;
UPDATE `quest_request_items` SET `CompletionText` = 'With that chunk of fallen rock, I''ll be able to complete the dedication of the moonwell.' WHERE `ID` = 33113;
UPDATE `quest_request_items` SET `CompletionText` = 'With the soul shards combined, we will trap Gul''dan and put an end to the Shadow Council on Draenor.' WHERE `ID` = 33114;
UPDATE `quest_request_items` SET `CompletionText` = 'With the combined might of the shards, we should be able to trap Gul''dan.' WHERE `ID` = 33168;
UPDATE `quest_request_items` SET `CompletionText` = 'You''re back already? It feels like we spoke only moments ago.
' WHERE `ID` = 33228;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found anything?
' WHERE `ID` = 33336;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find all the ingredients I need?' WHERE `ID` = 33461;
UPDATE `quest_request_items` SET `CompletionText` = 'We are the Laughing Skull! We do not flinch in the face of death. We laugh at it.
' WHERE `ID` = 33548;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you make that thing scream? Did it beg for mercy? Did you kill it before taking its eye? Tell me everything.
' WHERE `ID` = 33563;
UPDATE `quest_request_items` SET `CompletionText` = 'What kind of sick individual burns a book full of perfectly good dark arts?!' WHERE `ID` = 33581;
UPDATE `quest_request_items` SET `CompletionText` = 'I need more reagents before I return to my brothers and sisters.
' WHERE `ID` = 33660;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have something for me, little beast?
' WHERE `ID` = 33695;
UPDATE `quest_request_items` SET `CompletionText` = 'I don''t know why those idiots don''t just collect all the pages in one place.
' WHERE `ID` = 33724;
UPDATE `quest_request_items` SET `CompletionText` = 'These are more than mere objects. They are our livelihood, our past and future, our comfort.$B$BThey are pieces of us.' WHERE `ID` = 33734;
UPDATE `quest_request_items` SET `CompletionText` = 'Hm, what is that book you have there?' WHERE `ID` = 33761;
UPDATE `quest_request_items` SET `CompletionText` = 'Your aid is appreciated, $c.' WHERE `ID` = 33795;
UPDATE `quest_request_items` SET `CompletionText` = 'I just wanted to pick some herbs and relax with my boys... I should have stayed in Azeroth.' WHERE `ID` = 33808;
UPDATE `quest_request_items` SET `CompletionText` = 'My brother, Anduur, gathers wild berries from the hills above our village.$B$BIt was during one of his excursions that he met up with Maa''run.$B$BI demand retribution for his injuries.' WHERE `ID` = 33836;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you collected enough Aruunem berries?' WHERE `ID` = 33873;
UPDATE `quest_request_items` SET `CompletionText` = 'I trust you have Karab''uun. I am not known for my patience when the countless souls inside Auchindoun are in danger.' WHERE `ID` = 33920;
UPDATE `quest_request_items` SET `CompletionText` = 'Did the demon have Sha''tari as we thought?' WHERE `ID` = 33958;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the fangs? We don''t have much time!' WHERE `ID` = 33967;
UPDATE `quest_request_items` SET `CompletionText` = 'Did the foul demon have Sha''tari as we thought?
' WHERE `ID` = 33970;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the fangs? We don''t have much time!
' WHERE `ID` = 33971;
UPDATE `quest_request_items` SET `CompletionText` = 'The Blademaster must pay...' WHERE `ID` = 33973;
UPDATE `quest_request_items` SET `CompletionText` = 'We need the final piece of the Heart!' WHERE `ID` = 33976;
UPDATE `quest_request_items` SET `CompletionText` = 'Restalaan would be happy to know that someone fulfilled his wishes.' WHERE `ID` = 33988;
UPDATE `quest_request_items` SET `CompletionText` = 'Some things are worth fighting for, $r. These are such things.' WHERE `ID` = 34013;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to acquire the aid of the Ango''rosh?' WHERE `ID` = 34092;
UPDATE `quest_request_items` SET `CompletionText` = 'Any luck tracking down that bird, commander?' WHERE `ID` = 34103;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you had time to kill Hilaani?' WHERE `ID` = 34104;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you collected enough arcane essence yet?' WHERE `ID` = 34403;
UPDATE `quest_request_items` SET `CompletionText` = 'All of Auchindoun, and the countless souls within, depends on our success.' WHERE `ID` = 34407;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the crystal giant heart?' WHERE `ID` = 34415;
UPDATE `quest_request_items` SET `CompletionText` = 'We need to get that ore before those damned goren eat it all.
' WHERE `ID` = 34577;
UPDATE `quest_request_items` SET `CompletionText` = 'Those orders would be really useful in piecing this whole thing together.' WHERE `ID` = 34593;
UPDATE `quest_request_items` SET `CompletionText` = 'Wingblades forged in the name of a sun god to bring freedom and glory to her children.$B$BA mask worn by a great king who would walk among his people in disguise to know their true nature.' WHERE `ID` = 34656;
UPDATE `quest_request_items` SET `CompletionText` = '$n, I can''t tell you how great it is to see you.' WHERE `ID` = 34678;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m having trouble seeing. I may not have long.' WHERE `ID` = 34719;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the eel sacs?' WHERE `ID` = 34761;
UPDATE `quest_request_items` SET `CompletionText` = 'Commander! Have ye had a moment to deal with the saberon?' WHERE `ID` = 34773;
UPDATE `quest_request_items` SET `CompletionText` = 'I don''t know what I would do without Tuliaa... she''s not just my sister. She''s my best friend.' WHERE `ID` = 34802;
UPDATE `quest_request_items` SET `CompletionText` = 'How can I help you, $c?' WHERE `ID` = 34836;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have my banner?
' WHERE `ID` = 34850;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the garrison blueprints, commander?
' WHERE `ID` = 34868;
UPDATE `quest_request_items` SET `CompletionText` = 'Bring to me the living essences of the elements, that I may plant the seeds of rebirth.' WHERE `ID` = 34881;
UPDATE `quest_request_items` SET `CompletionText` = 'You know those elixirs you have been so eagerly quaffing?$B$BThey are made of this stuff.' WHERE `ID` = 34883;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the Ember Blossom?' WHERE `ID` = 34894;
UPDATE `quest_request_items` SET `CompletionText` = 'Ah, arcane powder. Reminds me of my days as an apprentice.
' WHERE `ID` = 34909;
UPDATE `quest_request_items` SET `CompletionText` = 'It''s all come down to this moment.
' WHERE `ID` = 34912;
UPDATE `quest_request_items` SET `CompletionText` = 'We must have all the sacred texts! We cannot afford to leave even a single one unaccounted for!' WHERE `ID` = 34922;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to find the stolen raven eggs?' WHERE `ID` = 34924;
UPDATE `quest_request_items` SET `CompletionText` = 'You''ll have to pry that key out of his cold, ugly hand.' WHERE `ID` = 34925;
UPDATE `quest_request_items` SET `CompletionText` = 'A blademaster without a blade is no blademaster at all.' WHERE `ID` = 34954;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have my banner?' WHERE `ID` = 34955;
UPDATE `quest_request_items` SET `CompletionText` = 'Any luck?' WHERE `ID` = 34958;
UPDATE `quest_request_items` SET `CompletionText` = 'Don''t go doin'' anything inappropriate with that gunpowder, now.' WHERE `ID` = 34987;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find any Youngroot?' WHERE `ID` = 34994;
UPDATE `quest_request_items` SET `CompletionText` = 'Reshad sent an outsider here? You must be very important... or very dangerous.' WHERE `ID` = 34998;
UPDATE `quest_request_items` SET `CompletionText` = 'My attempts to bottle the pooled blood have failed. It breaks down and dissipates when it is taken away from Sethe''s bones.$B$BBut I have high hopes for this congealed form!' WHERE `ID` = 34999;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you silenced the false king?' WHERE `ID` = 35011;
UPDATE `quest_request_items` SET `CompletionText` = 'Who... are you? Why have you stirred me?' WHERE `ID` = 35013;
UPDATE `quest_request_items` SET `CompletionText` = 'Afraid to get your hands dirty? They are just bodies now, no need to be scared.
' WHERE `ID` = 35016;
UPDATE `quest_request_items` SET `CompletionText` = 'These prisoners are no less brave than you or I, $n. Give them a weapon and an ounce of hope and they will fight like the storm.' WHERE `ID` = 35019;
UPDATE `quest_request_items` SET `CompletionText` = 'What has that orc done to you?!
' WHERE `ID` = 35041;
UPDATE `quest_request_items` SET `CompletionText` = 'Do ya have that oil for me yet?' WHERE `ID` = 35089;
UPDATE `quest_request_items` SET `CompletionText` = 'Got any parts for me?' WHERE `ID` = 35090;
UPDATE `quest_request_items` SET `CompletionText` = 'Don''t forget! Get the orders and take ''em to Dalgorsh further in.
' WHERE `ID` = 35157;
UPDATE `quest_request_items` SET `CompletionText` = 'Supplies are getting really low, commander.' WHERE `ID` = 35166;
UPDATE `quest_request_items` SET `CompletionText` = 'Can we speak a little later, $GSir:Madam;? I don''t really have time to talk at the moment.' WHERE `ID` = 35176;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the pollen?' WHERE `ID` = 35204;
UPDATE `quest_request_items` SET `CompletionText` = 'Now I see why some become Rangari. This is exciting.' WHERE `ID` = 35209;
UPDATE `quest_request_items` SET `CompletionText` = 'What have ya found?' WHERE `ID` = 35216;
UPDATE `quest_request_items` SET `CompletionText` = 'Not fond of this place. If the plants ain''t tryin'' to kill you then the ground is tryin'' to swallow ya up.' WHERE `ID` = 35234;
UPDATE `quest_request_items` SET `CompletionText` = 'Hm? What''s that you have there?' WHERE `ID` = 35245;
UPDATE `quest_request_items` SET `CompletionText` = 'The Apexis had every advantage, and yet they vanished. What could have happened?' WHERE `ID` = 35258;
UPDATE `quest_request_items` SET `CompletionText` = 'Impressive, aren''t they? My own creation.$B$BA simple wooden effigy bearing just a pinch of enchantment.' WHERE `ID` = 35260;
UPDATE `quest_request_items` SET `CompletionText` = 'I''d recognize one of my schematics anywhere.
' WHERE `ID` = 35322;
UPDATE `quest_request_items` SET `CompletionText` = 'I''d recognize one of my schematics anywhere.' WHERE `ID` = 35329;
UPDATE `quest_request_items` SET `CompletionText` = 'What have you found?
' WHERE `ID` = 35406;
UPDATE `quest_request_items` SET `CompletionText` = 'I hope you''re toting a cannon and some balls, soldier.' WHERE `ID` = 35408;
UPDATE `quest_request_items` SET `CompletionText` = 'Few dare challenge the botani in the field of growing plants.
' WHERE `ID` = 35429;
UPDATE `quest_request_items` SET `CompletionText` = 'For years the Laughing Skull would not touch the sacred waters. We feared the wrath of the botani. We should have set them to burn long ago.
' WHERE `ID` = 35434;
UPDATE `quest_request_items` SET `CompletionText` = 'The families of my squad need closure and we need more information on their deaths.' WHERE `ID` = 35633;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you bring the device?' WHERE `ID` = 35634;
UPDATE `quest_request_items` SET `CompletionText` = 'Here, I''ll take them both for safekeeping.' WHERE `ID` = 35636;
UPDATE `quest_request_items` SET `CompletionText` = 'Those pods are critical $p, I need them!' WHERE `ID` = 35647;
UPDATE `quest_request_items` SET `CompletionText` = 'Pleasure to see you, $Gsir:madame;.' WHERE `ID` = 35674;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to gain access to any battleplans?
' WHERE `ID` = 35750;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find anything?
' WHERE `ID` = 35761;
UPDATE `quest_request_items` SET `CompletionText` = 'Did ye find anything?' WHERE `ID` = 35926;
UPDATE `quest_request_items` SET `CompletionText` = 'I have plenty of meat. You should buy some.$B$BWhat I really need are bones. Nagrand''s animals are the heartiest on all of Draenor. They have the finest-quality bones.$B$BI''m making the tastiest soup you''ve ever tried. I''ll show that Grogglefitz who the best cook truly is.' WHERE `ID` = 35928;
UPDATE `quest_request_items` SET `CompletionText` = 'This missive bears the mark of the Warsong clan.' WHERE `ID` = 35933;
UPDATE `quest_request_items` SET `CompletionText` = 'I don''t want to stick around here any longer than we need to.' WHERE `ID` = 36048;
UPDATE `quest_request_items` SET `CompletionText` = 'This garrison isn''t going to build itself, commander! We need timber!' WHERE `ID` = 36189;
UPDATE `quest_request_items` SET `CompletionText` = 'The saberon should definitely NOT have any of the herbs you have found!' WHERE `ID` = 36441;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have something for me, little beast?' WHERE `ID` = 36442;
UPDATE `quest_request_items` SET `CompletionText` = 'You found Nat? The real Nat Pagle?!
' WHERE `ID` = 36609;
UPDATE `quest_request_items` SET `CompletionText` = 'What did you catch?
' WHERE `ID` = 36611;
UPDATE `quest_request_items` SET `CompletionText` = 'My people may not care much for me, but that will not stop me from caring for them.' WHERE `ID` = 37257;
UPDATE `quest_request_items` SET `CompletionText` = 'So you''ve got them?
' WHERE `ID` = 37284;
UPDATE `quest_request_items` SET `CompletionText` = 'The arcanum hums in your hand as you get close to the memorial.' WHERE `ID` = 37322;
UPDATE `quest_request_items` SET `CompletionText` = 'No good lazy...$B$B Eh?  Do you have my blackjack?  Did you catch any peons sleeping on the job?!' WHERE `ID` = 37446;
UPDATE `quest_request_items` SET `CompletionText` = 'Once we have enough demon blood, you can begin the ritual.
' WHERE `ID` = 37447;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you seen him?' WHERE `ID` = 37492;
UPDATE `quest_request_items` SET `CompletionText` = 'Go on. Go talk to him.' WHERE `ID` = 37507;
UPDATE `quest_request_items` SET `CompletionText` = 'Are we speaking again because you have my eggs?' WHERE `ID` = 37727;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to meet with the headmistress?' WHERE `ID` = 37730;
UPDATE `quest_request_items` SET `CompletionText` = 'Clever $r. Yes, a ley crystal should bring them back to their senses.' WHERE `ID` = 37859;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have them? Please tell me you have them, my friend.' WHERE `ID` = 37959;
UPDATE `quest_request_items` SET `CompletionText` = 'With each one of these cretins you slay, I grow stronger.' WHERE `ID` = 37960;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find anything?' WHERE `ID` = 38036;
UPDATE `quest_request_items` SET `CompletionText` = 'Someone entangled us within a sinister spell.' WHERE `ID` = 38147;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found the pieces of the recipe?' WHERE `ID` = 38203;
UPDATE `quest_request_items` SET `CompletionText` = 'This land is ripe for the taking. Especially the olives. They are really ripe. And I love ripe olives.' WHERE `ID` = 38232;
UPDATE `quest_request_items` SET `CompletionText` = 'Make sure ye''ve got enough bones before we move on.' WHERE `ID` = 38324;
UPDATE `quest_request_items` SET `CompletionText` = 'Smells good, doesn''t it?' WHERE `ID` = 38331;
UPDATE `quest_request_items` SET `CompletionText` = 'Oh, what do you have there?
' WHERE `ID` = 38337;
UPDATE `quest_request_items` SET `CompletionText` = 'Do ye have enough for a proper disguise?' WHERE `ID` = 38339;
UPDATE `quest_request_items` SET `CompletionText` = 'Gods, what is that stench?! $B$BThis disguise had better work!' WHERE `ID` = 38347;
UPDATE `quest_request_items` SET `CompletionText` = 'Did it work?' WHERE `ID` = 38455;
UPDATE `quest_request_items` SET `CompletionText` = 'You''re here from Alard''s shop? What does that musclehead want now?
' WHERE `ID` = 38505;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find the engineering shop?
' WHERE `ID` = 38507;
UPDATE `quest_request_items` SET `CompletionText` = 'I have no patterns for helms or boots.$B$BA tauren who cannot survive a few blows to the hoof has no place in battle. Boots are of little use to us.$B$BA helm is a coward''s armor. I am sorry if this offends you, but it is true.$B$BLegplates, however, do play a vital role. I will gladly share this pattern with you, once you bring me my father''s hammer.
' WHERE `ID` = 38519;
UPDATE `quest_request_items` SET `CompletionText` = 'Let''s get to work. I think you''ll enjoy this.
' WHERE `ID` = 38522;
UPDATE `quest_request_items` SET `CompletionText` = 'Watch your step out here on the front lines. This isn''t your peaceful floating city''s blacksmithing shop.
' WHERE `ID` = 38526;
UPDATE `quest_request_items` SET `CompletionText` = 'Are you ready to learn?
' WHERE `ID` = 38527;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get your hands on one?
' WHERE `ID` = 38532;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find the oscillator?' WHERE `ID` = 38558;
UPDATE `quest_request_items` SET `CompletionText` = 'Commander, it''s you! Good, I need someone steady at my back.
' WHERE `ID` = 38570;
UPDATE `quest_request_items` SET `CompletionText` = 'I''ll need building supplies, commander. Can''t build docks of ice and snow.
' WHERE `ID` = 38574;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get all the gear you needed?
' WHERE `ID` = 38614;
UPDATE `quest_request_items` SET `CompletionText` = 'The corn isn''t gonna gather itself.' WHERE `ID` = 38647;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you collected the root samples?' WHERE `ID` = 38655;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the Tears of Elune?' WHERE `ID` = 38662;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the keys?' WHERE `ID` = 38717;
UPDATE `quest_request_items` SET `CompletionText` = '$n, are you ready?
' WHERE `ID` = 38728;
UPDATE `quest_request_items` SET `CompletionText` = 'Some of our demon hunters are missing. Did you see them back on the Molten Shore?
' WHERE `ID` = 38759;
UPDATE `quest_request_items` SET `CompletionText` = 'What''s that you''ve got there, boy?
' WHERE `ID` = 38777;
UPDATE `quest_request_items` SET `CompletionText` = 'My shackles remain...' WHERE `ID` = 38778;
UPDATE `quest_request_items` SET `CompletionText` = 'You bring me somethin'' new?
' WHERE `ID` = 38795;
UPDATE `quest_request_items` SET `CompletionText` = 'Looks like you''ve been busy down there, miner.
' WHERE `ID` = 38796;
UPDATE `quest_request_items` SET `CompletionText` = 'Excuse me, I must have... wait, that smell is coming from YOU?
' WHERE `ID` = 38806;
UPDATE `quest_request_items` SET `CompletionText` = 'What do you bring?' WHERE `ID` = 38810;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to recover her remains?' WHERE `ID` = 38817;
UPDATE `quest_request_items` SET `CompletionText` = 'Gather as many eggs as you can and bring them back to me. I will keep them safe.' WHERE `ID` = 38862;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you had any luck with the Rivermane?' WHERE `ID` = 38909;
UPDATE `quest_request_items` SET `CompletionText` = 'This is a hard day.' WHERE `ID` = 39027;
UPDATE `quest_request_items` SET `CompletionText` = 'If we don''t know what they''re planning, we''re at a disadvantage fighting them.' WHERE `ID` = 39050;
UPDATE `quest_request_items` SET `CompletionText` = 'What have you found?' WHERE `ID` = 39061;
UPDATE `quest_request_items` SET `CompletionText` = 'So you''ve got every last one?
' WHERE `ID` = 39107;
UPDATE `quest_request_items` SET `CompletionText` = 'Papa always said the only way he''d leave here would be feet-first.$B$BI wish he''d been wrong.' WHERE `ID` = 39117;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you recovered my Bloodstone yet?
' WHERE `ID` = 39179;
UPDATE `quest_request_items` SET `CompletionText` = '$n, we need you to scan the cave with your spectral sight.

We must know if there are Legion forces magically hidden within.' WHERE `ID` = 39262;
UPDATE `quest_request_items` SET `CompletionText` = 'For this group of drogbar to turn against us after so many years of peace...' WHERE `ID` = 39277;
UPDATE `quest_request_items` SET `CompletionText` = 'They slew many of my brothers and sisters, but at least some managed to escape. Others, however, we captured.' WHERE `ID` = 39316;
UPDATE `quest_request_items` SET `CompletionText` = 'Any luck?' WHERE `ID` = 39354;
UPDATE `quest_request_items` SET `CompletionText` = 'Your size belies your strength, $n.' WHERE `ID` = 39373;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you had any luck with Lasan?' WHERE `ID` = 39387;
UPDATE `quest_request_items` SET `CompletionText` = 'This appears to be the last verse.' WHERE `ID` = 39405;
UPDATE `quest_request_items` SET `CompletionText` = 'I have power over the earth without my crystal, but my power is much greater with it than without.' WHERE `ID` = 39425;
UPDATE `quest_request_items` SET `CompletionText` = 'We have possessed these relics for generations until the murlocs put their fishy flippers on them.' WHERE `ID` = 39439;
UPDATE `quest_request_items` SET `CompletionText` = 'Has Torok agreed to join us?' WHERE `ID` = 39456;
UPDATE `quest_request_items` SET `CompletionText` = 'The drogbar used to control only earthen magic, but it seems they''ve found a way to draw power from other sources.' WHERE `ID` = 39487;
UPDATE `quest_request_items` SET `CompletionText` = 'I believe the drogbar are learning stronger magic now that they have possession of the Hammer of Khaz''goroth.' WHERE `ID` = 39488;
UPDATE `quest_request_items` SET `CompletionText` = 'The Rivermane are a peaceful tribe. We provide the others with food and healing in exchange for protection and equipment.

When pressed, however, I am willing to put my magic to more violent use.' WHERE `ID` = 39491;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you manage to find any of those Soul Remnants I mentioned?
' WHERE `ID` = 39499;
UPDATE `quest_request_items` SET `CompletionText` = 'An ironic gift you bring me, challenger.' WHERE `ID` = 39590;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you managed to find them all?' WHERE `ID` = 39593;
UPDATE `quest_request_items` SET `CompletionText` = 'What is this you bring?$B$BYou honor me, outsider.' WHERE `ID` = 39595;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you snatched the rabbits yet?' WHERE `ID` = 39670;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you acquired any breastplates?
' WHERE `ID` = 39726;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to find him?
' WHERE `ID` = 39729;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you recovered the soul chambers yet?' WHERE `ID` = 39764;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found my skull?' WHERE `ID` = 39772;
UPDATE `quest_request_items` SET `CompletionText` = 'You must weaken the demons so I am able to trap them.' WHERE `ID` = 39774;
UPDATE `quest_request_items` SET `CompletionText` = 'Worms. Why did it have to be worms? I hate worms.' WHERE `ID` = 39776;
UPDATE `quest_request_items` SET `CompletionText` = 'Has the corruption been removed?' WHERE `ID` = 39788;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to secure the lantern?' WHERE `ID` = 39849;
UPDATE `quest_request_items` SET `CompletionText` = 'I''ve been waitin'' all day for Addie to finish her first draft.$b$bHow hard can it be to write a few words about the greatest hunter who''s ever lived?' WHERE `ID` = 39859;
UPDATE `quest_request_items` SET `CompletionText` = 'You needn''t spend money on expensive breastplates or robes. Simple bracers will do.
' WHERE `ID` = 39863;
UPDATE `quest_request_items` SET `CompletionText` = 'I''ll have the last laugh when Hemet sees proof that this magical lion exists!' WHERE `ID` = 39867;
UPDATE `quest_request_items` SET `CompletionText` = 'Almost done enchanting those vellums?' WHERE `ID` = 39875;
UPDATE `quest_request_items` SET `CompletionText` = 'Crystals aren''t the only thing the spirits respond to. There are others, but that is another tale for another time.
' WHERE `ID` = 39879;
UPDATE `quest_request_items` SET `CompletionText` = 'Welcome back, $n. Did you make contact with the tauren?
' WHERE `ID` = 39883;
UPDATE `quest_request_items` SET `CompletionText` = 'The rod is an extension of me, and I of it. It would be nice to hold it once more.
' WHERE `ID` = 39904;
UPDATE `quest_request_items` SET `CompletionText` = 'The jailer has... the key...' WHERE `ID` = 40002;
UPDATE `quest_request_items` SET `CompletionText` = 'I am glad you continue to come to my shop, $n. I am useless with a weapon. We need adventurers like you to solve cases like this.
' WHERE `ID` = 40016;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find out what was eating the foxflower? Was it a goat? A beaver? A nightsaber?
' WHERE `ID` = 40026;
UPDATE `quest_request_items` SET `CompletionText` = 'What do you have there, herbalist?
' WHERE `ID` = 40029;
UPDATE `quest_request_items` SET `CompletionText` = 'Thank you for your willingness to travel, $n.
' WHERE `ID` = 40041;
UPDATE `quest_request_items` SET `CompletionText` = 'I hope you bring some friends with you on this journey, for this may be your greatest lesson.
' WHERE `ID` = 40042;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found answers, or more questions?' WHERE `ID` = 40046;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found any runes yet?
' WHERE `ID` = 40048;
UPDATE `quest_request_items` SET `CompletionText` = 'Put an end to Tamer Korgrul, so that we may also put an end to the training of siege worms.' WHERE `ID` = 40071;
UPDATE `quest_request_items` SET `CompletionText` = 'How may I help you?
' WHERE `ID` = 40131;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you seen the sparks?
' WHERE `ID` = 40142;
UPDATE `quest_request_items` SET `CompletionText` = 'Have those amateur hunters scattered? Don''t be afraid to use your fists if words don''t do the job.' WHERE `ID` = 40170;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m starting to think we make a pretty good team.
' WHERE `ID` = 40183;
UPDATE `quest_request_items` SET `CompletionText` = 'This is probably the biggest project I''ve ever been a part of. It''s quite exciting!
' WHERE `ID` = 40197;
UPDATE `quest_request_items` SET `CompletionText` = 'Make sure it''s nice and cozy!
' WHERE `ID` = 40201;
UPDATE `quest_request_items` SET `CompletionText` = 'Keep an eye on the gnome while you''re huntin''. She''s never held a rifle before.' WHERE `ID` = 40216;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have it?
' WHERE `ID` = 40222;
UPDATE `quest_request_items` SET `CompletionText` = 'Don''t just stand there, head out into the basin and find that bird!' WHERE `ID` = 40228;
UPDATE `quest_request_items` SET `CompletionText` = 'Just the presence of such a vibrant enchanter gives my home the spark of life!
' WHERE `ID` = 40265;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find anything?' WHERE `ID` = 40300;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the tome, $r?' WHERE `ID` = 40306;
UPDATE `quest_request_items` SET `CompletionText` = 'What was that? I heard a familiar voice... it couldn''t be.' WHERE `ID` = 40319;
UPDATE `quest_request_items` SET `CompletionText` = 'Feed Theryn as much as he will take.' WHERE `ID` = 40324;
UPDATE `quest_request_items` SET `CompletionText` = 'We will slay them all!' WHERE `ID` = 40331;
UPDATE `quest_request_items` SET `CompletionText` = 'Throndyr deserved a more honorable death.' WHERE `ID` = 40332;
UPDATE `quest_request_items` SET `CompletionText` = 'I will help you collect what we need.' WHERE `ID` = 40334;
UPDATE `quest_request_items` SET `CompletionText` = 'What you lookin'' at, stink head?' WHERE `ID` = 40339;
UPDATE `quest_request_items` SET `CompletionText` = 'You come in when jobs are done.' WHERE `ID` = 40345;
UPDATE `quest_request_items` SET `CompletionText` = 'Move quickly, $c! These sea giants have an insatiable appetite!' WHERE `ID` = 40364;
UPDATE `quest_request_items` SET `CompletionText` = 'I was worried something had happened to you in the forest. I am glad that I was wrong.' WHERE `ID` = 40424;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find the smuggler? What did they say?' WHERE `ID` = 40469;
UPDATE `quest_request_items` SET `CompletionText` = 'Earth, air, and water are all magics we have come to know well in our mountain.' WHERE `ID` = 40520;
UPDATE `quest_request_items` SET `CompletionText` = 'How goes the hunt for the ring?
' WHERE `ID` = 40525;
UPDATE `quest_request_items` SET `CompletionText` = 'How''d you do?
' WHERE `ID` = 40526;
UPDATE `quest_request_items` SET `CompletionText` = 'How''d you do?
' WHERE `ID` = 40527;
UPDATE `quest_request_items` SET `CompletionText` = 'How''d you do?
' WHERE `ID` = 40528;
UPDATE `quest_request_items` SET `CompletionText` = 'Try not to get any blood on them while you''re out "adventuring".
' WHERE `ID` = 40529;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find him? Were you able to recover the jewels?
' WHERE `ID` = 40531;
UPDATE `quest_request_items` SET `CompletionText` = 'Make sure not to break the raw gem. We don''t just have a stockpile of those lying around.
' WHERE `ID` = 40532;
UPDATE `quest_request_items` SET `CompletionText` = 'Make sure not to break the raw gem. We don''t just have a stockpile of those lying around.
' WHERE `ID` = 40533;
UPDATE `quest_request_items` SET `CompletionText` = 'Make sure not to break the raw gem. We don''t just have a stockpile of those lying around.
' WHERE `ID` = 40534;
UPDATE `quest_request_items` SET `CompletionText` = 'Try not to attract too much attention, okay?
' WHERE `ID` = 40539;
UPDATE `quest_request_items` SET `CompletionText` = 'You''re going to have to travel all over the world for these, I hope you''re up to the challenge.
' WHERE `ID` = 40558;
UPDATE `quest_request_items` SET `CompletionText` = 'A book, you''ll find, is a design for the mind!
' WHERE `ID` = 40559;
UPDATE `quest_request_items` SET `CompletionText` = 'This will easily be the finest piece in my collection.
' WHERE `ID` = 40561;
UPDATE `quest_request_items` SET `CompletionText` = 'Is he alive? Will my husband return to me?' WHERE `ID` = 40567;
UPDATE `quest_request_items` SET `CompletionText` = 'Is that the one?
' WHERE `ID` = 40606;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found anything, $n?
' WHERE `ID` = 40634;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you retrieved the Heart?
' WHERE `ID` = 40668;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find enough?' WHERE `ID` = 40730;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have what I require, $r? We don''t have much time to spare.' WHERE `ID` = 40744;
UPDATE `quest_request_items` SET `CompletionText` = 'Salvaging the equipment here is necessary if I am to develop a teleporter network for Thalyssra.' WHERE `ID` = 40747;
UPDATE `quest_request_items` SET `CompletionText` = 'Can you help me? Is there nothing you can do?' WHERE `ID` = 40796;
UPDATE `quest_request_items` SET `CompletionText` = 'Is there something you need fixed?
' WHERE `ID` = 40854;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the Fresh Fel-Flesh I require?' WHERE `ID` = 40898;
UPDATE `quest_request_items` SET `CompletionText` = 'What news do you bring of Grimwing the Devourer?' WHERE `ID` = 40901;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the Legion Emblems?' WHERE `ID` = 40929;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you successful?' WHERE `ID` = 40947;
UPDATE `quest_request_items` SET `CompletionText` = 'How fares the education?' WHERE `ID` = 40965;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you locate them?' WHERE `ID` = 40967;
UPDATE `quest_request_items` SET `CompletionText` = 'Is it done?' WHERE `ID` = 40970;
UPDATE `quest_request_items` SET `CompletionText` = 'Mackerel may not be extravagant, but it will fill your belly.' WHERE `ID` = 40991;
UPDATE `quest_request_items` SET `CompletionText` = 'What is this?' WHERE `ID` = 41030;
UPDATE `quest_request_items` SET `CompletionText` = 'We must hurry!' WHERE `ID` = 41036;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the recipe?
' WHERE `ID` = 41039;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you pass the trials?
' WHERE `ID` = 41059;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have it?' WHERE `ID` = 41123;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you served those who suffer?' WHERE `ID` = 41148;
UPDATE `quest_request_items` SET `CompletionText` = 'I can''t wait to read the rest of that story.
' WHERE `ID` = 41168;
UPDATE `quest_request_items` SET `CompletionText` = 'The working theory is that due to the amount of gunpowder that''s being used, it should only produce a small shock to whatever the artifact has been encased in.
' WHERE `ID` = 41178;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you brought the supplies we requested?' WHERE `ID` = 41207;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the snares, $r?' WHERE `ID` = 41230;
UPDATE `quest_request_items` SET `CompletionText` = 'Can you imagine, a Lespin original hiding under a pile of leaves? What a waste.' WHERE `ID` = 41307;
UPDATE `quest_request_items` SET `CompletionText` = 'Hold, peasant. What business have you with the illustrious Johnny Awesome?
' WHERE `ID` = 41367;
UPDATE `quest_request_items` SET `CompletionText` = 'Do not tarry, $C. The longer you take, the longer until you may dote on me as one of my many admirers.
' WHERE `ID` = 41394;
UPDATE `quest_request_items` SET `CompletionText` = 'What''s this? You are not my usual courier...
' WHERE `ID` = 41411;
UPDATE `quest_request_items` SET `CompletionText` = 'Are you ready?
' WHERE `ID` = 41422;
UPDATE `quest_request_items` SET `CompletionText` = 'He was so passionate, so driven. I saw his vision, created it to his exact specifications. Beautiful filigree and enamel put to a fearsome weapon...' WHERE `ID` = 41466;
UPDATE `quest_request_items` SET `CompletionText` = 'The Tidemistress is a dangerous foe. We must be just as cunning to defeat her.' WHERE `ID` = 41709;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you retrieved the Heart of Skywall?
' WHERE `ID` = 41771;
UPDATE `quest_request_items` SET `CompletionText` = 'I will devour the heart of Pyroth with great pleasure!
' WHERE `ID` = 41773;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found those ingredients yet? Time really isn''t on your side, you know.
' WHERE `ID` = 41780;
UPDATE `quest_request_items` SET `CompletionText` = 'Pleased to make your acquaintance.' WHERE `ID` = 41834;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find more of the shards?
' WHERE `ID` = 41840;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m quite anxious to see how it turns out.
' WHERE `ID` = 41889;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you recover the Idol of the Wilds?' WHERE `ID` = 42036;
UPDATE `quest_request_items` SET `CompletionText` = 'How many shards have we collected?' WHERE `ID` = 42049;
UPDATE `quest_request_items` SET `CompletionText` = 'Not to worry, it will not hurt $Ghim:her;.' WHERE `ID` = 42079;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you recovered the soul yet?
' WHERE `ID` = 42098;
UPDATE `quest_request_items` SET `CompletionText` = 'With enough soul shards, we should have the power to create the anchor.
' WHERE `ID` = 42100;
UPDATE `quest_request_items` SET `CompletionText` = 'We will need to feed the Bloodstone before it will be strong enough to control the eredar sisters.
' WHERE `ID` = 42103;
UPDATE `quest_request_items` SET `CompletionText` = 'Was there much killing?' WHERE `ID` = 42129;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you made contact with our sympathizers?' WHERE `ID` = 42147;
UPDATE `quest_request_items` SET `CompletionText` = 'I hope we''ve found all of the books.' WHERE `ID` = 42149;
UPDATE `quest_request_items` SET `CompletionText` = 'I thought I''d snoop around a bit before I met you at the rotunda. Unfortunately my invisibility spell wore off at an inopportune time. I''m glad you found me! What is this you have found, $n?' WHERE `ID` = 42171;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you bring back my family''s heirlooms, $R?
' WHERE `ID` = 42194;
UPDATE `quest_request_items` SET `CompletionText` = 'Oh no...' WHERE `ID` = 42271;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to find the Blood of Sargeras?
' WHERE `ID` = 42365;
UPDATE `quest_request_items` SET `CompletionText` = 'Don''t ask where I got the eye. Worst case is I tell you and then it gets all awkward between us.' WHERE `ID` = 42375;
UPDATE `quest_request_items` SET `CompletionText` = 'Be careful not to kill the felhound when trapping it. I need the subject alive to perform my tests.
' WHERE `ID` = 42406;
UPDATE `quest_request_items` SET `CompletionText` = 'The enchanting process cannot be completed without the proper reagents.
' WHERE `ID` = 42408;
UPDATE `quest_request_items` SET `CompletionText` = 'What have you discovered, $n?' WHERE `ID` = 42423;
UPDATE `quest_request_items` SET `CompletionText` = 'Have your champions discovered anything of note about Archmage Vargoth?' WHERE `ID` = 42424;
UPDATE `quest_request_items` SET `CompletionText` = 'I have never been particularly fond of heights.' WHERE `ID` = 42425;
UPDATE `quest_request_items` SET `CompletionText` = 'Never has the Nightmare spilled into our world. It is our duty to find the root of this evil, and destroy it.' WHERE `ID` = 42432;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found the Pearl and scrolls?' WHERE `ID` = 42435;
UPDATE `quest_request_items` SET `CompletionText` = 'Have we found what we need yet?' WHERE `ID` = 42452;
UPDATE `quest_request_items` SET `CompletionText` = 'You found everything in my vault? I hope the defenses weren''t a bother.' WHERE `ID` = 42455;
UPDATE `quest_request_items` SET `CompletionText` = 'I trust you were successful?' WHERE `ID` = 42476;
UPDATE `quest_request_items` SET `CompletionText` = 'Well, what did Daio have to say?' WHERE `ID` = 42477;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find it?' WHERE `ID` = 42488;
UPDATE `quest_request_items` SET `CompletionText` = 'What did you find?' WHERE `ID` = 42489;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find it?' WHERE `ID` = 42491;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to locate Millhouse?' WHERE `ID` = 42521;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the heads of my enemies? I want to look upon each and every face...
' WHERE `ID` = 42534;
UPDATE `quest_request_items` SET `CompletionText` = 'We need the sword Trol''kalar to open this tomb. Have you found it?
' WHERE `ID` = 42536;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you recovered the oak yet?
' WHERE `ID` = 42654;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you mined the ore yet?
' WHERE `ID` = 42655;
UPDATE `quest_request_items` SET `CompletionText` = 'We will need special weapons if we wish to take down Hakkar and his hounds.
' WHERE `ID` = 42656;
UPDATE `quest_request_items` SET `CompletionText` = 'The Bloodstone will grow in power after consuming Cordana''s heart.
' WHERE `ID` = 42660;
UPDATE `quest_request_items` SET `CompletionText` = '$n, were you successful? Do you have the Raven''s Eye?
' WHERE `ID` = 42678;
UPDATE `quest_request_items` SET `CompletionText` = 'Thank you for your aid, $c.' WHERE `ID` = 42694;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you obtained a vial of arcane water yet?' WHERE `ID` = 42707;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you obtained the Obliterum?
' WHERE `ID` = 42732;
UPDATE `quest_request_items` SET `CompletionText` = '$n, do you have what Allari asked you to harvest for fuel?
' WHERE `ID` = 42733;
UPDATE `quest_request_items` SET `CompletionText` = 'Enjoying yourself?' WHERE `ID` = 42832;
UPDATE `quest_request_items` SET `CompletionText` = 'Having trouble?' WHERE `ID` = 42834;
UPDATE `quest_request_items` SET `CompletionText` = 'You have found a fruit that might be of interest to me?' WHERE `ID` = 42857;
UPDATE `quest_request_items` SET `CompletionText` = 'Highlord, you have returned.
' WHERE `ID` = 42890;
UPDATE `quest_request_items` SET `CompletionText` = 'You bring the demonic runestones, $n?
' WHERE `ID` = 42918;
UPDATE `quest_request_items` SET `CompletionText` = 'Have your champions found a way to gain access to the Oculus yet?' WHERE `ID` = 42940;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found enough nightwell energy yet?' WHERE `ID` = 42955;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found anything special for Ari yet?' WHERE `ID` = 42959;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to collect the necessary amount?
' WHERE `ID` = 42983;
UPDATE `quest_request_items` SET `CompletionText` = 'I hope it was easy to convince Lady Hatecoil to part with her scepter.
' WHERE `ID` = 42984;
UPDATE `quest_request_items` SET `CompletionText` = 'Neltharion collected many valuable relics. The Earthen Amulet was one of them.
' WHERE `ID` = 42990;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found the key to resurrecting Thunderaan?
' WHERE `ID` = 43002;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have leather to trade?
' WHERE `ID` = 43151;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found the missing pieces yet?
' WHERE `ID` = 43182;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found the Raven''s Eye yet?
' WHERE `ID` = 43251;
UPDATE `quest_request_items` SET `CompletionText` = 'Thalyssra asks much of me.' WHERE `ID` = 43309;
UPDATE `quest_request_items` SET `CompletionText` = 'I am prepared. It is nearly time.' WHERE `ID` = 43317;
UPDATE `quest_request_items` SET `CompletionText` = 'I know you will defend my honor, $n.' WHERE `ID` = 43318;
UPDATE `quest_request_items` SET `CompletionText` = 'I''ve been asking around. The pandaren locals are terrified of this place. It''s been haunted since the end of Hellscream''s Pandaren Campaign.$B$BDid you find an offering for the White Tiger?
' WHERE `ID` = 43338;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the shards?' WHERE `ID` = 43361;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have it?' WHERE `ID` = 43362;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to recover the runestones?
' WHERE `ID` = 43384;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you acquired any lumenstone?
' WHERE `ID` = 43400;
UPDATE `quest_request_items` SET `CompletionText` = 'I am fairly adept in twelve different languages, and I hope to add more to the list.
' WHERE `ID` = 43487;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you bring the runestone we require, $n?
' WHERE `ID` = 43506;
UPDATE `quest_request_items` SET `CompletionText` = 'It may take some effort to convince Farondis'' people to part with the draught; some among them still cling desperately to their past lives.
' WHERE `ID` = 43514;
UPDATE `quest_request_items` SET `CompletionText` = 'You have the essence?
' WHERE `ID` = 43517;
UPDATE `quest_request_items` SET `CompletionText` = 'It can be difficult to extract properly, but I do not wish to leave anything to chance.
' WHERE `ID` = 43518;
UPDATE `quest_request_items` SET `CompletionText` = 'How many Nightshards were you able to retrieve?
' WHERE `ID` = 43531;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you acquired any Blood of Sargeras?
' WHERE `ID` = 43534;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you acquired the Braid of the Underking?
' WHERE `ID` = 43571;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the Nightmare Lash?
' WHERE `ID` = 43572;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you brought me the Maul of the Dead?
' WHERE `ID` = 43574;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you acquired any lumenstone?
' WHERE `ID` = 43698;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you managed to thin their numbers?' WHERE `ID` = 43702;
UPDATE `quest_request_items` SET `CompletionText` = 'These seals provide an additional chance at treasure in dungeons and raids, but at what cost? Your order will certainly not miss these extra resources, but I must ask: When does it end?  Will you ever stop risking others lives just to satisfy your greedy nature?

You can only obtain three seals per week.  This counts as one of those three.  Next week, I will have others.' WHERE `ID` = 43892;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you identify the body? Was it an SI:7 operative?
' WHERE `ID` = 43958;
UPDATE `quest_request_items` SET `CompletionText` = 'Show me what you''ve found.' WHERE `ID` = 44009;
UPDATE `quest_request_items` SET `CompletionText` = 'Stand firm, druid.' WHERE `ID` = 44074;
UPDATE `quest_request_items` SET `CompletionText` = 'It takes a ferocious beast to take down another ferocious beast.' WHERE `ID` = 44075;
UPDATE `quest_request_items` SET `CompletionText` = 'My heart aches for those fallen to the Nightmare.' WHERE `ID` = 44076;
UPDATE `quest_request_items` SET `CompletionText` = 'We follow Elune''s path.' WHERE `ID` = 44077;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the goods?
' WHERE `ID` = 44178;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you retrieved the pendant?
' WHERE `ID` = 44282;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you retrieved the parts?
' WHERE `ID` = 44286;
UPDATE `quest_request_items` SET `CompletionText` = 'When our work is complete, I will be lost to the Great Dark.' WHERE `ID` = 44464;
UPDATE `quest_request_items` SET `CompletionText` = 'You mustn''t lose hope.' WHERE `ID` = 44466;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you felt it? Change is on the wind.' WHERE `ID` = 44562;
UPDATE `quest_request_items` SET `CompletionText` = 'There is much to be done.' WHERE `ID` = 44563;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you learned where the captives have been taken?' WHERE `ID` = 44724;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you dealt with Aargoss?' WHERE `ID` = 44726;
UPDATE `quest_request_items` SET `CompletionText` = 'Dire news like this cannot wait.' WHERE `ID` = 44742;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found some scrolls?' WHERE `ID` = 44770;
UPDATE `quest_request_items` SET `CompletionText` = 'It is really child''s play when you consider the magical weaves. I can see the flaws with just a few minutes of study.' WHERE `ID` = 44834;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find any supplies we can use in Helheim $n?
' WHERE `ID` = 44850;
UPDATE `quest_request_items` SET `CompletionText` = 'This ley line energy will not move itself. We must give it encouragement.' WHERE `ID` = 44874;
UPDATE `quest_request_items` SET `CompletionText` = 'Greetings, $n.$B$BDid you intercept Gul''dan''s message to Skovald?
' WHERE `ID` = 44886;
UPDATE `quest_request_items` SET `CompletionText` = 'We need to get to the bottom of what the Legion is planning.
' WHERE `ID` = 44887;
UPDATE `quest_request_items` SET `CompletionText` = 'How are you finding the challenges of Karazhan?
' WHERE `ID` = 44917;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you obtained the fel crystals?
' WHERE `ID` = 45025;
UPDATE `quest_request_items` SET `CompletionText` = 'Have the crystals been depleted?
' WHERE `ID` = 45026;
UPDATE `quest_request_items` SET `CompletionText` = 'I will need to submerge the scroll in demon blood in order for the runes to reveal themselves.
' WHERE `ID` = 45146;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found something?' WHERE `ID` = 45185;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the samples I''ve requested?
' WHERE `ID` = 45344;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you acquired the Shimmering Dust I so desperately need?
' WHERE `ID` = 45345;
UPDATE `quest_request_items` SET `CompletionText` = 'These animals are unable to be infused with fel magic, but I doubt the Feltotem stopped here.
' WHERE `ID` = 45564;
UPDATE `quest_request_items` SET `CompletionText` = 'These Feltotem need to be dealt with.
' WHERE `ID` = 45575;
UPDATE `quest_request_items` SET `CompletionText` = 'Convincing the giant colossi of Silithus to wake up requires a whole heap of meat. Lucky for you, Silithus is crawling with sandworms, and the colossi don''t seem to mind the taste too much!
' WHERE `ID` = 45637;
UPDATE `quest_request_items` SET `CompletionText` = 'We need meat - any kind of meat - to feed the colossi... and there''s no cheaper meat than spider meat. You can find plenty of it out in Outland.
' WHERE `ID` = 45638;
UPDATE `quest_request_items` SET `CompletionText` = 'De beasts of Northrend are big, heavy, and full of meat. Go find sometin'' we can feed to the colossi.
' WHERE `ID` = 45639;
UPDATE `quest_request_items` SET `CompletionText` = 'Down south, in Pandaria, the tigers grow fat hunting smaller creatures. Bring me some of their meat.
' WHERE `ID` = 45641;
UPDATE `quest_request_items` SET `CompletionText` = 'We need meat, and lots of it. You look pretty tough - maybe you could go slay some beasts in de Broken Isles.
' WHERE `ID` = 45643;
UPDATE `quest_request_items` SET `CompletionText` = 'Convincing the giant colossi of Silithus to wake up requires a whole heap of meat. Lucky for you, Silithus is crawling with sandworms, and the colossi don''t seem to mind the taste too much!
' WHERE `ID` = 45729;
UPDATE `quest_request_items` SET `CompletionText` = 'We need meat - any kind of meat - to feed the colossi... and there''s no cheaper meat than spider meat. You can find plenty of it out in Outland.
' WHERE `ID` = 45730;
UPDATE `quest_request_items` SET `CompletionText` = 'De beasts of Northrend are big, heavy, and full of meat. Go find sometin'' we can feed to the colossi.
' WHERE `ID` = 45731;
UPDATE `quest_request_items` SET `CompletionText` = 'Down south, in Pandaria, the tigers grow fat hunting smaller creatures. Bring me some of their meat.
' WHERE `ID` = 45733;
UPDATE `quest_request_items` SET `CompletionText` = 'We need meat, and lots of it. You look pretty tough - maybe you could go slay some beasts in the Broken Isles.
' WHERE `ID` = 45735;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you secured the materialss for repairing the Fel Hammer, $n?
' WHERE `ID` = 45764;
UPDATE `quest_request_items` SET `CompletionText` = 'Keep these imps off me!' WHERE `ID` = 45916;
UPDATE `quest_request_items` SET `CompletionText` = 'How goes the search for the barding? Find anything suitable yet?
' WHERE `ID` = 46070;
UPDATE `quest_request_items` SET `CompletionText` = 'I doubt you''ll have a problem getting the leystone, but the sapphire might be a bit harder to acquire.
' WHERE `ID` = 46083;
UPDATE `quest_request_items` SET `CompletionText` = 'Applying the resources gathered by our order will allow us to make quick progress.
' WHERE `ID` = 46108;
UPDATE `quest_request_items` SET `CompletionText` = 'This is a great deal, boss! Applying the resources gathered by our order will let us make big-time progress.
' WHERE `ID` = 46129;
UPDATE `quest_request_items` SET `CompletionText` = 'Applying the resources gathered by our order will allow us to make quick progress.
' WHERE `ID` = 46130;
UPDATE `quest_request_items` SET `CompletionText` = 'Applyin'' the resources gathered by our order will allow us to make quick progress toward learnin'' about that weapon.
' WHERE `ID` = 46132;
UPDATE `quest_request_items` SET `CompletionText` = 'Applying the resources gathered by our order will allow us to make quick progress.
' WHERE `ID` = 46140;
UPDATE `quest_request_items` SET `CompletionText` = 'Applying the resources gathered by our order will allow us to make quick progress.
' WHERE `ID` = 46143;
UPDATE `quest_request_items` SET `CompletionText` = 'Applying the resources gathered by our order will allow us to make quick progress.
' WHERE `ID` = 46144;
UPDATE `quest_request_items` SET `CompletionText` = 'Hey, you know what? If you slip me even more order resources, I can put together more notes about your artifact weapon''s history and potential.$B$BYou need to power up your weapon, and I can pass along the knowledge to get it done.$B$BBring me those resources as soon as you can. We''ve got a business to run here!
' WHERE `ID` = 46148;
UPDATE `quest_request_items` SET `CompletionText` = 'I hope you brought backup with you.' WHERE `ID` = 46213;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you the necessary materials?
' WHERE `ID` = 46238;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the core?
' WHERE `ID` = 46239;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you bled the owlkin dry?
' WHERE `ID` = 46240;
UPDATE `quest_request_items` SET `CompletionText` = 'I trust you found the stone?
' WHERE `ID` = 46242;
UPDATE `quest_request_items` SET `CompletionText` = 'There is little time. Mephistroth must be defeated, and the Cathedral of the Eternal Night secured.' WHERE `ID` = 46244;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the shards? I hope you kept an accurate count. If you counted wrong, I simply can''t be held responsible for the consequences.' WHERE `ID` = 46251;
UPDATE `quest_request_items` SET `CompletionText` = 'Well met, $n. What brings you to Stormwind this day?' WHERE `ID` = 46268;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you get it?
' WHERE `ID` = 46323;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found anything promising?' WHERE `ID` = 46335;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find anything?' WHERE `ID` = 46339;
UPDATE `quest_request_items` SET `CompletionText` = 'Find my luckydo yet? Getting kind of hot here.
' WHERE `ID` = 46344;
UPDATE `quest_request_items` SET `CompletionText` = 'How goes the Moon Lily collection, Grandmaster?
' WHERE `ID` = 46349;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m always lookin'' for more treasure!' WHERE `ID` = 46499;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m always lookin'' for more treasure!' WHERE `ID` = 46501;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m always lookin'' for more treasure!' WHERE `ID` = 46509;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m always lookin'' for more treasure!' WHERE `ID` = 46510;
UPDATE `quest_request_items` SET `CompletionText` = 'You fetch that treasure yet?' WHERE `ID` = 46511;
UPDATE `quest_request_items` SET `CompletionText` = 'Collecting some missives should allow me to figure out the commander''s position.
' WHERE `ID` = 46675;
UPDATE `quest_request_items` SET `CompletionText` = 'Please, they should not be made to suffer any longer.' WHERE `ID` = 46834;
UPDATE `quest_request_items` SET `CompletionText` = 'Our fight goes on, champion. Argus must fall.$b$bWhat is that you''ve found?' WHERE `ID` = 47102;
UPDATE `quest_request_items` SET `CompletionText` = 'Even I could not foresee the strange ways in which you would fight your enemies $n.' WHERE `ID` = 47148;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you dealt with High Inquisitor Raalgar yet?' WHERE `ID` = 47182;
UPDATE `quest_request_items` SET `CompletionText` = 'I see the path clearly, $n.' WHERE `ID` = 47219;
UPDATE `quest_request_items` SET `CompletionText` = 'What is this? Such darkness...' WHERE `ID` = 47220;
UPDATE `quest_request_items` SET `CompletionText` = 'Those bats are always a nuisance to deal with. This method will be more... efficient, I believe.' WHERE `ID` = 47508;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found the orders and the code book?' WHERE `ID` = 47554;
UPDATE `quest_request_items` SET `CompletionText` = 'It is a heavy burden I have placed upon you, $n. I have faith you will not fail.' WHERE `ID` = 47654;
UPDATE `quest_request_items` SET `CompletionText` = 'Display the Mark of Cunning or leave me alone.' WHERE `ID` = 47685;
UPDATE `quest_request_items` SET `CompletionText` = 'Archimonde himself... what have we gotten ourselves into?' WHERE `ID` = 47690;
UPDATE `quest_request_items` SET `CompletionText` = 'The people of Suramar spent 10,000 years tapping into the latent energies of a dead titan. I wonder if any of them considered what might happen if they suddenly stopped doing so.
' WHERE `ID` = 47790;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the components?' WHERE `ID` = 47986;
UPDATE `quest_request_items` SET `CompletionText` = 'Remember - immaculate!' WHERE `ID` = 47990;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you brought me something, $C?
' WHERE `ID` = 48231;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to find enough clusters?
' WHERE `ID` = 48261;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find all the fragments?
' WHERE `ID` = 48271;
UPDATE `quest_request_items` SET `CompletionText` = 'Oh ho, whatcha got there? Primal Sargerite? Sounds fancy!$b$bI bet if we mash some ''o that stuff with Obliterum, we can make it beefier! Give it more of a punch when you apply it to yer armor.$b$bWhaddya say, want ta give it a try?' WHERE `ID` = 48375;
UPDATE `quest_request_items` SET `CompletionText` = 'You seek the aid of another ridgestalker?
' WHERE `ID` = 48634;
UPDATE `quest_request_items` SET `CompletionText` = 'Many of my brethren are deeply touched by shadow. It will take a tremendous effort to free them. Will you help?' WHERE `ID` = 48635;
UPDATE `quest_request_items` SET `CompletionText` = 'If you bring the necessary supplies, I can begin the distillation process, $n.

I can only free one of the Void-Touched with this few resources once per week.' WHERE `ID` = 48911;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the brains?
' WHERE `ID` = 50226;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the silithid larvae?
' WHERE `ID` = 50227;
UPDATE `quest_request_items` SET `CompletionText` = 'We cannot allow the Twilight''s Hammer to regain their foothold in Silithus.
' WHERE `ID` = 50228;
UPDATE `quest_request_items` SET `CompletionText` = 'Did ye acquire "the goods?"
' WHERE `ID` = 50229;
UPDATE `quest_request_items` SET `CompletionText` = 'Hey kid! You got the stuff?
' WHERE `ID` = 50230;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the silithid larvae?
' WHERE `ID` = 50231;
UPDATE `quest_request_items` SET `CompletionText` = 'We cannot allow the Twilight''s Hammer to regain their foothold in Silithus!
' WHERE `ID` = 50232;
UPDATE `quest_template` SET `LogTitle` = 'Pet Battles Not Active' WHERE `ID` = 37972;
UPDATE `quest_template` SET `LogTitle` = 'A Fel Puppy Of My Own' WHERE `ID` = 38428;
UPDATE `quest_template` SET `LogTitle` = 'Ashran Dominance' WHERE `ID` = 38925;
UPDATE `quest_template` SET `LogTitle` = 'Ashran Dominance' WHERE `ID` = 39294;
UPDATE `quest_template` SET `LogTitle` = 'Ashran Dominance' WHERE `ID` = 39522;
UPDATE `quest_template` SET `LogTitle` = 'Coarse Leystone Outcropping' WHERE `ID` = 41201;
UPDATE `quest_template` SET `LogTitle` = 'Bright Leystone Deposits' WHERE `ID` = 41203;
UPDATE `quest_template` SET `LogTitle` = 'Hard Leystone Deposits' WHERE `ID` = 41204;
UPDATE `quest_template` SET `LogTitle` = 'Supplies Needed: Leystone' WHERE `ID` = 41207;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Foxflower' WHERE `ID` = 41223;
UPDATE `quest_template` SET `LogTitle` = 'Calcified Wormscales' WHERE `ID` = 41238;
UPDATE `quest_template` SET `LogTitle` = 'Huge Cursed Queenfish' WHERE `ID` = 41265;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Stormrays' WHERE `ID` = 41277;
UPDATE `quest_template` SET `LogTitle` = 'Supplies Needed: Aethril' WHERE `ID` = 41288;
UPDATE `quest_template` SET `LogTitle` = 'Flourishing Aethril' WHERE `ID` = 41289;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Dreamleaf' WHERE `ID` = 41292;
UPDATE `quest_template` SET `LogTitle` = 'Dreamleaf-Covered Ancient' WHERE `ID` = 41295;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Leystone' WHERE `ID` = 41312;
UPDATE `quest_template` SET `LogTitle` = 'Supplies Needed: Leystone' WHERE `ID` = 41315;
UPDATE `quest_template` SET `LogTitle` = 'Supplies Needed: Leystone' WHERE `ID` = 41316;
UPDATE `quest_template` SET `LogTitle` = 'Supplies Needed: Leystone' WHERE `ID` = 41317;
UPDATE `quest_template` SET `LogTitle` = 'Supplies Needed: Felslate' WHERE `ID` = 41318;
UPDATE `quest_template` SET `LogTitle` = 'Supplies Needed: Stormscales' WHERE `ID` = 41327;
UPDATE `quest_template` SET `LogTitle` = 'Rugged Wolf Hide' WHERE `ID` = 41333;
UPDATE `quest_template` SET `LogTitle` = 'Musky Bear Hide' WHERE `ID` = 41334;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Stonehide Leather' WHERE `ID` = 41338;
UPDATE `quest_template` SET `LogTitle` = 'Thick Bear Hide' WHERE `ID` = 41342;
UPDATE `quest_template` SET `LogTitle` = 'Solid Crabshell Fragment' WHERE `ID` = 41343;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Stormscales' WHERE `ID` = 41344;
UPDATE `quest_template` SET `LogTitle` = 'Supplies Needed: Stormscales' WHERE `ID` = 41345;
UPDATE `quest_template` SET `LogTitle` = 'Fiery Leystone Deposits' WHERE `ID` = 41432;
UPDATE `quest_template` SET `LogTitle` = 'Massive Leystone Deposits' WHERE `ID` = 41433;
UPDATE `quest_template` SET `LogTitle` = 'Smooth Leystone Deposits' WHERE `ID` = 41435;
UPDATE `quest_template` SET `LogTitle` = 'Exquisite Leystone Deposits' WHERE `ID` = 41439;
UPDATE `quest_template` SET `LogTitle` = 'Ancient Leystone Deposits' WHERE `ID` = 41443;
UPDATE `quest_template` SET `LogTitle` = 'Brimstone Destroyer' WHERE `ID` = 41484;
UPDATE `quest_template` SET `LogTitle` = 'Brimstone Destroyer' WHERE `ID` = 41491;
UPDATE `quest_template` SET `LogTitle` = 'Brimstone Destroyer' WHERE `ID` = 41492;
UPDATE `quest_template` SET `LogTitle` = 'Leyworms' WHERE `ID` = 41500;
UPDATE `quest_template` SET `LogTitle` = 'Leystone Basilisks' WHERE `ID` = 41507;
UPDATE `quest_template` SET `LogTitle` = 'Wispy Foxflower' WHERE `ID` = 41525;
UPDATE `quest_template` SET `LogTitle` = 'Iridescent Aethril' WHERE `ID` = 41528;
UPDATE `quest_template` SET `LogTitle` = 'Bushy Dreamleaf' WHERE `ID` = 41532;
UPDATE `quest_template` SET `LogTitle` = 'Brambly Fjarnskaggl' WHERE `ID` = 41534;
UPDATE `quest_template` SET `LogTitle` = 'Foxflower Cluster' WHERE `ID` = 41544;
UPDATE `quest_template` SET `LogTitle` = 'Fjarnskaggl Cluster' WHERE `ID` = 41547;
UPDATE `quest_template` SET `LogTitle` = 'Lively Cursed Queenfish' WHERE `ID` = 41598;
UPDATE `quest_template` SET `LogTitle` = 'Lively Mossgill Perch' WHERE `ID` = 41600;
UPDATE `quest_template` SET `LogTitle` = 'Huge Highmountain Salmon' WHERE `ID` = 41609;
UPDATE `quest_template` SET `LogTitle` = 'Huge Mossgill Perch' WHERE `ID` = 41612;
UPDATE `quest_template` SET `LogTitle` = 'Huge Stormrays' WHERE `ID` = 41614;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Leystone Breastplate' WHERE `ID` = 41636;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Battlebound Armbands' WHERE `ID` = 41641;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Warhide Footpads' WHERE `ID` = 41642;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Warhide Gloves' WHERE `ID` = 41644;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Silkweave Robe' WHERE `ID` = 41647;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Silkweave Bracers' WHERE `ID` = 41648;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Silkweave Hood' WHERE `ID` = 41650;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Skystone Pendant' WHERE `ID` = 41653;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Queen''s Opal Loop' WHERE `ID` = 41654;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Queen''s Opal Pendant' WHERE `ID` = 41655;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Azsunite Loop' WHERE `ID` = 41656;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Draughts of Raw Magic' WHERE `ID` = 41657;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Sylvan Elixirs' WHERE `ID` = 41658;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Avalanche Elixirs' WHERE `ID` = 41659;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Skaggldrynk' WHERE `ID` = 41660;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Skystep Potions' WHERE `ID` = 41661;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Ancient Rejuvenation Potions' WHERE `ID` = 41662;
UPDATE `quest_template` SET `LogTitle` = 'Vantus Rune Work Order: Elerethe Renferal' WHERE `ID` = 41663;
UPDATE `quest_template` SET `LogTitle` = 'Vantus Rune Work Order: Dragons of Nightmare' WHERE `ID` = 41664;
UPDATE `quest_template` SET `LogTitle` = 'Vantus Rune Work Order: Ursoc' WHERE `ID` = 41665;
UPDATE `quest_template` SET `LogTitle` = 'Vantus Rune Work Order: Nythendra' WHERE `ID` = 41666;
UPDATE `quest_template` SET `LogTitle` = 'Vantus Rune Work Order: Il''gynoth, The Heart of Corruption' WHERE `ID` = 41668;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Word of Haste' WHERE `ID` = 41672;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Word of Intellect' WHERE `ID` = 41674;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Gunpack' WHERE `ID` = 41678;
UPDATE `quest_template` SET `LogTitle` = 'Work Order: Failure Detection Pylon' WHERE `ID` = 41680;
UPDATE `quest_template` SET `LogTitle` = 'Fate Sealed' WHERE `ID` = 47040;
UPDATE `quest_template` SET `LogDescription` = 'Defeat the enemy faction at the event locations in Ashran and slay their leader within their base.' WHERE `ID` = 38925;
UPDATE `quest_template` SET `LogDescription` = 'Defeat the Horde at all event locations in Ashran and kill High Warlord Volrath.' WHERE `ID` = 39294;
UPDATE `quest_template` SET `LogDescription` = 'Defeat the Horde at the event locations in Ashran and kill High Warlord Volrath.' WHERE `ID` = 39522;
UPDATE `quest_template` SET `LogDescription` = 'Fly with Vethir and kill 150 of the God-King''s allies in Hrydshal.' WHERE `ID` = 41950;
UPDATE `quest_template` SET `QuestDescription` = 'As we feared the Horde are trying to consolidate their position here on the island by looting it, just like we feared. Get out there and show them the Alliance won''t put up with their aggression.' WHERE `ID` = 38925;
UPDATE `quest_template` SET `QuestDescription` = 'As we feared the Horde are trying to consolidate their position here on the island by looting it, just like we feared. Get out there and show them the Alliance won''t put up with their aggression.' WHERE `ID` = 39294;
UPDATE `quest_template` SET `QuestDescription` = 'As we feared the Horde are trying to consolidate their position here on the island by looting it, just like we feared. Get out there and show them the Alliance won''t put up with their aggression.' WHERE `ID` = 39522;
UPDATE `quest_template` SET `QuestDescription` = 'You have proven yourself an ally of the Thorignir and we will lend you our strength. I would ask one last favor of our new champion, though. 

The dragon who guided you to me awaits his vengeance against the vrykul. Together I wish for you to show these Drekirjar what it means to cross the Thorignir. Their toll must be paid in blood.

Speak to Vethir when you are ready.' WHERE `ID` = 41950;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Chris Clarkie in the Alliance base inside Ashran.' WHERE `ID` = 39294;
UPDATE `quest_template` SET `PortraitGiverText` = 'Volrath leads the Horde forces in Ashran.' WHERE `ID` = 38925;
UPDATE `quest_template` SET `PortraitGiverText` = 'Volrath leads the Horde forces in Ashran.' WHERE `ID` = 39294;
UPDATE `quest_template` SET `PortraitGiverText` = 'Volrath leads the Horde forces in Ashran.' WHERE `ID` = 39522;
UPDATE `quest_objectives` SET `Description` = 'Garbage fished from the water' WHERE `ID` = 288591;
UPDATE `quest_objectives` SET `Description` = 'Assassinate the Orgrimmar Mark' WHERE `ID` = 288895;
UPDATE `quest_offer_reward` SET `RewardText` = 'Done, $n! Aviana’s egg will soon be delivered to the walls of the sanctuary. Do you think Aviana will return to us?
' WHERE `ID` = 25764;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, that’s just what you need. $B$bDon’t worry, $n ... soon the time will come for reprisals against the orcs.
' WHERE `ID` = 28179;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes they are bitten, and how bitten! Oh, okay. They won’t be lost anyway. $B$BThanks for the help, friend.
' WHERE `ID` = 29770;
UPDATE `quest_offer_reward` SET `RewardText` = 'A fine weapon. It should suit your needs well.$B$BNow let''s put it to use.' WHERE `ID` = 30034;
UPDATE `quest_offer_reward` SET `RewardText` = 'It’s sad to hear that Khaohan has so many problems. Thank you for telling me about this. We will try to help him.
' WHERE `ID` = 30522;
UPDATE `quest_offer_reward` SET `RewardText` = 'Das sind nette Pelzchen, $GJunge:Mädel;. Die geben sicher ''n paar mächtige Mäntel ab.
' WHERE `ID` = 31160;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ihr seid sehr gut in Form. Eines Tages werdet Ihr sehr mächtig sein.
' WHERE `ID` = 31161;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, that’s what you need. We use the magic of the Council of Shadows against themselves.
' WHERE `ID` = 34230;
UPDATE `quest_offer_reward` SET `RewardText` = 'It’s a pity that it happened, but I understand perfectly the orcs of the War Song clan. I would not give up in their place either.
' WHERE `ID` = 35068;
UPDATE `quest_offer_reward` SET `RewardText` = 'Gul''dan resists my magic, $n! Hiding, scoundrel! $b$bWell, nothing, we’ll find it on him. I know how to increase the strength and range of my spell ...
' WHERE `ID` = 35994;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, they are great.$B$BWell, let’s see if we manage to hold old Garm?
' WHERE `ID` = 38324;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yeah, it brings back memories. You didn’t look: you looked; by the numbers?$b$bIt belonged to old Nolan, may he rest in peace. He was not the best researcher, but he was strong in hops!
' WHERE `ID` = 38344;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, that’s just what you need.
' WHERE `ID` = 38612;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ihr habt ein beachtliches Talent für diese Art von Aufgaben an den Tag gelegt.

Es ist erfreulich, denn wir werden Euch noch mehr abverlangen müssen, wenn wir diesen Konflikt überleben wollen.' WHERE `ID` = 40710;
UPDATE `quest_offer_reward` SET `RewardText` = 'The diary radiates dark energy. Apparently, Ariden made notes in him about what happened during his stay at Deadwind Pass. One of the notes stands out from the rest: “The Nightbane Pack has recently intensified. There are rumors that Scythe of Elune has left Darnassus. Obviously, she is already nearby because she draws the worgen to her. Here they are take me to her. These
' WHERE `ID` = 40835;
UPDATE `quest_offer_reward` SET `RewardText` = 'The diary radiates dark energy. Apparently, Ariden made notes in him about what happened during his stay at Deadwind Pass. One of the entries is different from the others: “I hear a whisper. They call me from the damp land of shallow graves, urging me to recall my heritage. But what kind of heritage are we talking about? The merchant I was once had no great ancestors ... And yet I am drawn to him. To this terrible blade ... the destroyer of the world ... Apocalypse ... "
' WHERE `ID` = 40932;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is a great honor for my brother Wuho and me to go with us, $n. Our people’s predatory claw is considered a sacred artifact, and I’m sure that we will definitely find it together. And with such weapons the Legion will also drive us out of our land. Once and forever!
' WHERE `ID` = 41542;
UPDATE `quest_offer_reward` SET `RewardText` = 'It was an honor for me to fight with you shoulder to shoulder in the Underdark, Farseer ;. By your courage and determination you inspire hope in our order. But, I am afraid, the worst is yet to come. You should not bear this burden alone. Let me fight on your side again. I won’t let you down.
' WHERE `ID` = 41746;
UPDATE `quest_offer_reward` SET `RewardText` = 'I haven’t met anyone from the order for a long time.$B$BIf you want to offer me a return, I’m afraid now it’s impossible.
' WHERE `ID` = 42389;
UPDATE `quest_offer_reward` SET `RewardText` = 'It’s hard to imagine how many lives you $gsaved: saved; by collecting these vials.
' WHERE `ID` = 43375;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, that’s enough.
' WHERE `ID` = 43488;
UPDATE `quest_offer_reward` SET `RewardText` = 'It is done. Let’s collect the Valarjars for a glorious battle!
' WHERE `ID` = 43506;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, that’s just what I need! $B$bNow go get acquainted with Rotfoot. I have no doubt that you will become ... sworn friends with him!
' WHERE `ID` = 44286;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yes, that’s so good.$B$BNow the students outside the tower should think that you are significantly superior to them, so that they will give you no problem information that will help you overcome the barrier.
' WHERE `ID` = 44915;
UPDATE `quest_offer_reward` SET `RewardText` = 'Yeah, you can’t expect good from the Abyss. We need to move on.
' WHERE `ID` = 47184;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ebenhorn hat uralte Zauberschutze erwähnt, die am Hochberg aufrechterhalten werden müssen. Diese Zauberschutze sollen eine große Finsternis zurückhalten.$b$bDas steht vielleicht im Zusammenhang mit der bösen Macht, die sich seiner bemächtigt hat.$b$bWir müssen darauf hoffen, dass uns Geistwandler Grauhimmel mehr darüber erzählen kann.' WHERE `ID` = 48079;
UPDATE `quest_request_items` SET `CompletionText` = 'I can’t wait until I can finally nail the horns of the ancient spirit to the wall of the Shelter!
' WHERE `ID` = 39178;
UPDATE `quest_request_items` SET `CompletionText` = 'Chatting with me, you won’t get a hawk, if that.
' WHERE `ID` = 40000;
UPDATE `quest_request_items` SET `CompletionText` = 'And look, do not dunk the gunpowder, otherwise you’ll be able to dry it.
' WHERE `ID` = 40873;
UPDATE `quest_request_items` SET `CompletionText` = '<Kozzak’s splinter moves, as if something were pulling him to the space allotted for him.>
' WHERE `ID` = 41098;
UPDATE `quest_request_items` SET `CompletionText` = 'Without Cora I won’t go anywhere.
' WHERE `ID` = 42391;
UPDATE `quest_request_items` SET `CompletionText` = 'What a cruel way to set a car in motion. They use souls for this ... I don’t even want to know what is happening to them there.
' WHERE `ID` = 42754;
UPDATE `quest_request_items` SET `CompletionText` = '<You put Aviana’s defiled idol on a pedestal.>
' WHERE `ID` = 46319;
UPDATE `quest_offer_reward` SET `RewardText` = 'Not bad, friend. There''s a natural grace in your swings... you may well have talent.$B$BThere are a few rough edges left to smooth out, of course, but I''ll be teaching you a thing or two in the days to come.' WHERE `ID` = 31158;
UPDATE `quest_offer_reward` SET `RewardText` = 'Another young blood, eh?$B$BStill, you look to be in good shape. Steady hands. Sharp eyes. You might make a real $C yet.$B$BLet''s not waste any more time.' WHERE `ID` = 31159;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work, $n. These worgen will regret ever setting foot in our lands.' WHERE `ID` = 14276;
UPDATE `quest_offer_reward` SET `RewardText` = 'Looks like you''ve caught his attention, $c. I think he likes you.' WHERE `ID` = 29678;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hah, $n! Now that''s a mallet if I''ve ever seen one! Let''s make some noise.' WHERE `ID` = 29768;
UPDATE `quest_offer_reward` SET `RewardText` = 'YEAH!!! $n, we make quite a team. Persistence over planning, I always say!' WHERE `ID` = 29774;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, challenger.' WHERE `ID` = 30879;
UPDATE `quest_offer_reward` SET `RewardText` = 'Really? That''s what they really said? Wow!' WHERE `ID` = 31537;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve shown everyone in Kalimdor that you''re a force to be reckoned with. But your journey is only beginning.' WHERE `ID` = 31891;
UPDATE `quest_offer_reward` SET `RewardText` = 'For the Horde! Your ancestors would be proud of you!$B$BI never doubted you.' WHERE `ID` = 31903;
UPDATE `quest_offer_reward` SET `RewardText` = 'Your strength grows. Let''s see if you can handle the grand master pet tamer of Outland!$B$BMay your battles bring you glory.$B$BAnother stage of your journey is complete.' WHERE `ID` = 31921;
UPDATE `quest_offer_reward` SET `RewardText` = 'Few have made it this far. And fewer still have faced the grand master pet tamer of Northrend! So prepare yourself.$B$BI will not lose!$B$BThe hardest trial awaits you.' WHERE `ID` = 31929;
UPDATE `quest_offer_reward` SET `RewardText` = 'By the Warchief''s blade, you fight like an orc! I think you''re ready to move on.$B$BYou can''t lose now.$B$BThink it''s time for the next match?' WHERE `ID` = 31967;
UPDATE `quest_offer_reward` SET `RewardText` = 'This codex is a book of incredible power, written in an ancient, pre-demonic language. It occurs to you to show it to one of the warlock trainers in the nearest capital city.' WHERE `ID` = 32295;
UPDATE `quest_offer_reward` SET `RewardText` = 'You''ve found all four soulstone fragments... Now all that remains is to bring them together...' WHERE `ID` = 32317;
UPDATE `quest_offer_reward` SET `RewardText` = 'Jubeka''s soulstone has led you to the Black Temple. Now you need only find a way inside...' WHERE `ID` = 32324;
UPDATE `quest_offer_reward` SET `RewardText` = 'What you got for Ku''ma?' WHERE `ID` = 32613;
UPDATE `quest_offer_reward` SET `RewardText` = 'The slime that was once Flesh''rok''s flesh oozes away into the sewer. By all appearances, he is either dead or so badly wounded that he will never recover.' WHERE `ID` = 32710;
UPDATE `quest_offer_reward` SET `RewardText` = 'The Rocky Horror smashed everything to pieces, but you managed to dodge the debris and keep from choking in the cloud of dust.' WHERE `ID` = 32713;
UPDATE `quest_offer_reward` SET `RewardText` = 'So this is it, huh? Let''s see what''s hiding in these depths.' WHERE `ID` = 34337;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was close, $n. Good work.' WHERE `ID` = 34338;
UPDATE `quest_offer_reward` SET `RewardText` = 'With fewer machines these weaklings will quickly lose their foothold on this island.$B$BExcellent work, $n.' WHERE `ID` = 34355;
UPDATE `quest_offer_reward` SET `RewardText` = 'With their leaders dead this operation will surely fall apart.' WHERE `ID` = 34397;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let''s not waste any time. Gordal Fortress awaits just up this hill.' WHERE `ID` = 34908;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, thank goodness. I don''t even have any weapons!' WHERE `ID` = 35719;
UPDATE `quest_offer_reward` SET `RewardText` = 'I know about dis Vor''gash. It be a relief ta know he won''t trouble us no more.' WHERE `ID` = 35842;
UPDATE `quest_offer_reward` SET `RewardText` = 'Dis is gud, $n. Dis be real gud.' WHERE `ID` = 35846;
UPDATE `quest_offer_reward` SET `RewardText` = 'Every little bit helps.' WHERE `ID` = 35867;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fantastic! This is some good old-fashioned adventuring if I''ve ever seen it.' WHERE `ID` = 35878;
UPDATE `quest_offer_reward` SET `RewardText` = 'These corpses are fresh. Their killers must still be nearby.' WHERE `ID` = 35907;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n. Transporting a brain is no easy task. I mean, they''re just so darn slippery.' WHERE `ID` = 35927;
UPDATE `quest_offer_reward` SET `RewardText` = 'Bah, no earrings or anything. Better luck next time, $C.' WHERE `ID` = 35937;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ouch... my leg is still asleep, that smarts... Greblin Fastfizzle''s my name, archeology''s my game.$B$BHow can I help?' WHERE `ID` = 35945;
UPDATE `quest_offer_reward` SET `RewardText` = 'We won''t let him get away.' WHERE `ID` = 36028;
UPDATE `quest_offer_reward` SET `RewardText` = 'OOOOH! THIS IS A LONG ONE. HE HE HAHAAH. HERE, TAKE THIS AS A REWARD.' WHERE `ID` = 36034;
UPDATE `quest_offer_reward` SET `RewardText` = 'Feeling safe, stranger?' WHERE `ID` = 36056;
UPDATE `quest_offer_reward` SET `RewardText` = 'Every little bit helps.' WHERE `ID` = 36063;
UPDATE `quest_offer_reward` SET `RewardText` = 'If we want to impress Nat, we''ll need to catch something really, really big!' WHERE `ID` = 36609;
UPDATE `quest_offer_reward` SET `RewardText` = 'MEATBALL FEELING BETTER NOW!$B$BMEATBALL FIGHT FOR $N NOW!$B$BMEATBALL ALWAYS FOLLOW $N!!!' WHERE `ID` = 36702;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our clan strong. Strongest.$B$BI feed our passion, make us stronger. We win!' WHERE `ID` = 37085;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, ya got dem for me? Excellent. Here''s ya money.' WHERE `ID` = 37284;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, commander.' WHERE `ID` = 37331;
UPDATE `quest_offer_reward` SET `RewardText` = 'Congratulations!' WHERE `ID` = 37669;
UPDATE `quest_offer_reward` SET `RewardText` = 'It be good ta hear da road is safer, but here be another problem.' WHERE `ID` = 37890;
UPDATE `quest_offer_reward` SET `RewardText` = 'Old earth... old blood. I smell Kilrogg. He has been here.' WHERE `ID` = 38271;
UPDATE `quest_offer_reward` SET `RewardText` = 'With so many of the spirits defeated, the aura of hatred emanating from the cave has noticeably weakened.' WHERE `ID` = 38273;
UPDATE `quest_offer_reward` SET `RewardText` = 'So, she escaped after all...' WHERE `ID` = 38360;
UPDATE `quest_offer_reward` SET `RewardText` = 'You now have enough information to track down the killer. You have pieced together a map.' WHERE `ID` = 38453;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fascinating...' WHERE `ID` = 38499;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent work! This new flux may do wonders for other craftable materials as well.' WHERE `ID` = 38500;
UPDATE `quest_offer_reward` SET `RewardText` = 'That''ll do.' WHERE `ID` = 38525;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ah, ya found us a shipwright? Good! Ya followers be eager ta take on da open seas.' WHERE `ID` = 38573;
UPDATE `quest_offer_reward` SET `RewardText` = 'What a fight! And here I was complaining this place was too boring.' WHERE `ID` = 38617;
UPDATE `quest_offer_reward` SET `RewardText` = 'Now that the ancient seed has sprouted, I can use my druidic gifts to stay in touch with you through this sapling.' WHERE `ID` = 38688;
UPDATE `quest_offer_reward` SET `RewardText` = 'I have sat idle within the walls of Acherus for far too long, and the Eternal Hunger gnaws at my soul. It is long past time I took to the battlefield and sated it in full.$b$bIt will be an honor to fight at your side, Deathlord.' WHERE `ID` = 38992;
UPDATE `quest_offer_reward` SET `RewardText` = 'Elisandria sent you? She''s a good soul. A fine friend and a true protector of nature.' WHERE `ID` = 39032;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done, $n. These docks are buzzing with activity.$B$B<Khadgar claps his hands together and rubs them. Something sinister glimmers in his pale blue eyes.>$B$BLet''s do some damage.' WHERE `ID` = 39057;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good work $n! It''s not a pretty situation down there.' WHERE `ID` = 39217;
UPDATE `quest_offer_reward` SET `RewardText` = 'They lured us right into their trap, Commander. I want revenge!' WHERE `ID` = 39401;
UPDATE `quest_offer_reward` SET `RewardText` = 'This be just what we need! I get my people at work on these right away, commander.' WHERE `ID` = 39512;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ya done good, mon. We gotta keep up da pressure.' WHERE `ID` = 39565;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is wonderful news, commander. We will soon have Gul''dan''s ghoulish citadel completely surrounded!' WHERE `ID` = 39574;
UPDATE `quest_offer_reward` SET `RewardText` = 'Great work, commander!' WHERE `ID` = 39674;
UPDATE `quest_offer_reward` SET `RewardText` = 'Equipment can really make a difference out there!' WHERE `ID` = 39676;
UPDATE `quest_offer_reward` SET `RewardText` = 'These pieces will do fine as examples. Now, let me explain how I crafted them...' WHERE `ID` = 39726;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is... this is amazing! There are techniques in here I''d never imagined trying. Good work, $n!' WHERE `ID` = 39729;
UPDATE `quest_offer_reward` SET `RewardText` = 'A fine choice, $ct.' WHERE `ID` = 39799;
UPDATE `quest_offer_reward` SET `RewardText` = 'Ye found me extra set o''pants!' WHERE `ID` = 40133;
UPDATE `quest_offer_reward` SET `RewardText` = 'What''cha be needin'' from me, mon?' WHERE `ID` = 40157;
UPDATE `quest_offer_reward` SET `RewardText` = 'Congratulations, Grand Master $n!' WHERE `ID` = 40236;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh, those are good ideas! Let''s get started.' WHERE `ID` = 40241;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hello again, champion. I see we are all here now.' WHERE `ID` = 40632;
UPDATE `quest_offer_reward` SET `RewardText` = 'Oh aye! This is exactly what we needed! I wuz about ta start loadin'' the guns wit'' any ol'' junk.' WHERE `ID` = 40860;
UPDATE `quest_offer_reward` SET `RewardText` = 'It''s good to see you again! Alonsus has decided to place me under your command. Now that we no longer need to hide in the shadows, I can reconnect with old acquaintances. I hope I won''t disappoint you. I know how to fight, and I''m well versed in healing. And just call me Calia. Lordaeron is no more.$b$bI can''t wait for us to start saving this world together, $GHigh Priest:High Priestess;!' WHERE `ID` = 41018;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mlrgmlr rmlgml! Mrlmgrlg gmlrmlrg, grmlgmlr lmrglgr mlgmrlr. Mlgrmlgr grmlmgl, Mrgrlilgrl...' WHERE `ID` = 41143;
UPDATE `quest_offer_reward` SET `RewardText` = 'It was successful? That''s excellent news!$B$BThis will speed up our process ten fold!' WHERE `ID` = 41178;
UPDATE `quest_offer_reward` SET `RewardText` = 'It seems the Ethereum have figured out how to use Malygos''s Surge Needles to delve deeper into the Twisting Nether.$B$BBut I have an idea for how to turn their own devices against them.' WHERE `ID` = 41628;
UPDATE `quest_offer_reward` SET `RewardText` = 'I see you have managed to harness the energy of Light''s Wrath. I can''t recall the last time a $c managed such a feat.

Well, are you ready to unleash this power?' WHERE `ID` = 41629;
UPDATE `quest_offer_reward` SET `RewardText` = 'I can see all my goats have been accounted for.$B$BNow, let''s see if we can do something about that curse.' WHERE `ID` = 41781;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, ye did it. Sylara is worth ten seasoned fighters.' WHERE `ID` = 41850;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mmmm, just smell those hops! This will be a good batch, I just know it.' WHERE `ID` = 41911;
UPDATE `quest_offer_reward` SET `RewardText` = 'So you seek Aluneth? A dangerous weapon. Very dangerous.$B$BLong ago, the mages of the Kirin Tor entrusted it to the blue dragons. The staff was placed in the one location where its untamed power could never break free: the Nexus Vault.$B$BBut it has been a long time since I was last there. After the blue dragons were all but wiped out, the Nexus was abandoned. No one knows anymore whether the vault still stands, or what has become of the staff.' WHERE `ID` = 42003;
UPDATE `quest_offer_reward` SET `RewardText` = 'Good, Mylra was successful in her mission! Our recruiting efforts have paid off.' WHERE `ID` = 42141;
UPDATE `quest_offer_reward` SET `RewardText` = 'Excellent, Archdruid. These will do nicely.' WHERE `ID` = 42365;
UPDATE `quest_offer_reward` SET `RewardText` = 'Every second I held those blades was torture. They''re all yours.' WHERE `ID` = 42504;
UPDATE `quest_offer_reward` SET `RewardText` = 'A wise choice, $n.' WHERE `ID` = 42611;
UPDATE `quest_offer_reward` SET `RewardText` = 'I can feel it. My soul is my own again!' WHERE `ID` = 42650;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mlrgmlr! Rgmrlmg, grmlmglr lmrglmrg mrlgmlglr! Mlrgmlrg grmlgrl.' WHERE `ID` = 42688;
UPDATE `quest_offer_reward` SET `RewardText` = 'These entrails are rich with magic. They''ll make excellent bait.' WHERE `ID` = 42691;
UPDATE `quest_offer_reward` SET `RewardText` = 'Mrrgml... mlrgmlrg. Mlrmglrg gmrlr!' WHERE `ID` = 42728;
UPDATE `quest_offer_reward` SET `RewardText` = 'Calia''s mission was a success! We may be seeing some new faces around here soon.' WHERE `ID` = 43273;
UPDATE `quest_offer_reward` SET `RewardText` = 'With this new power, nothing shall stop us!' WHERE `ID` = 43414;
UPDATE `quest_offer_reward` SET `RewardText` = 'Clean work.' WHERE `ID` = 43462;
UPDATE `quest_offer_reward` SET `RewardText` = 'There, now that is much better. I would say that our garden is much more beautiful.' WHERE `ID` = 43470;
UPDATE `quest_offer_reward` SET `RewardText` = 'The diversion worked!' WHERE `ID` = 43485;
UPDATE `quest_offer_reward` SET `RewardText` = 'Fantastic! This will do quite nicely.' WHERE `ID` = 43518;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done! Everything went as planned.' WHERE `ID` = 43519;
UPDATE `quest_offer_reward` SET `RewardText` = 'Very well then. Let it be done!' WHERE `ID` = 43604;
UPDATE `quest_offer_reward` SET `RewardText` = 'A wise choice.' WHERE `ID` = 43973;
UPDATE `quest_offer_reward` SET `RewardText` = 'Aye, matey! We''ve had some good voyages together! Blood was spilt, rum was drank, n'' our search fer clues was a success!$B$BI''ll level wit'' ye, $n. I be not havin'' such an adventure in some years now. Sailin'' wit'' ye felt like early mornin'' on th'' poop deck when th'' salty ocean rum splashes ye wide awake!$B$BHow abouts I come aboard n'' join yer crew as first matey?' WHERE `ID` = 44181;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our glaives are yours, $n.' WHERE `ID` = 44213;
UPDATE `quest_offer_reward` SET `RewardText` = 'In this fight, our spirits are as one, $n.' WHERE `ID` = 44249;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our blades are yours, $n.' WHERE `ID` = 44252;
UPDATE `quest_offer_reward` SET `RewardText` = 'I couldn''t agree more.' WHERE `ID` = 44375;
UPDATE `quest_offer_reward` SET `RewardText` = 'Look at that shine!' WHERE `ID` = 44449;
UPDATE `quest_offer_reward` SET `RewardText` = 'This is exactly what we needed.' WHERE `ID` = 44686;
UPDATE `quest_offer_reward` SET `RewardText` = 'I could feel their energy, even in undeath.' WHERE `ID` = 44783;
UPDATE `quest_offer_reward` SET `RewardText` = 'Well done! That couldn''t have been easy.$B$BThis should be enough fragments. Let''s have a look.' WHERE `ID` = 44887;
UPDATE `quest_offer_reward` SET `RewardText` = 'Thank ye, me friend. I feel better knowin'' I have been avenged.' WHERE `ID` = 45073;
UPDATE `quest_offer_reward` SET `RewardText` = 'That was surprisingly easy...' WHERE `ID` = 45329;
UPDATE `quest_offer_reward` SET `RewardText` = 'This cure could not have come at a better time.' WHERE `ID` = 45348;
UPDATE `quest_offer_reward` SET `RewardText` = 'Watching those vrykul shamble off mindlessly made my dead heart go "pitter patter".' WHERE `ID` = 45399;
UPDATE `quest_offer_reward` SET `RewardText` = 'Blowing up demons never gets old, does it? Ha!' WHERE `ID` = 45545;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let''s make this quick. It won''t be long before hordes of demons flood this valley.' WHERE `ID` = 45556;
UPDATE `quest_offer_reward` SET `RewardText` = 'Let''s not keep my tribe waiting.' WHERE `ID` = 45706;
UPDATE `quest_offer_reward` SET `RewardText` = 'Felblood has never been sweeter.' WHERE `ID` = 45723;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our fight doesn''t end here, $n.' WHERE `ID` = 45795;
UPDATE `quest_offer_reward` SET `RewardText` = 'I will not allow such insolence!' WHERE `ID` = 45883;
UPDATE `quest_offer_reward` SET `RewardText` = 'So now we know where the ritualists'' leader is.

If we''re lucky, she''ll be carrying one of Hel''nurath''s calling stones.' WHERE `ID` = 46241;
UPDATE `quest_offer_reward` SET `RewardText` = 'They''re right. They''re absolutely right.' WHERE `ID` = 46275;
UPDATE `quest_offer_reward` SET `RewardText` = 'Hmm let me take a look... Yes, I think I can counter these!' WHERE `ID` = 46320;
UPDATE `quest_offer_reward` SET `RewardText` = 'They left with such purpose... fools.' WHERE `ID` = 46324;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our power grows.' WHERE `ID` = 46779;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our power grows.' WHERE `ID` = 46780;
UPDATE `quest_offer_reward` SET `RewardText` = 'Our power grows.' WHERE `ID` = 46783;
UPDATE `quest_offer_reward` SET `RewardText` = 'I knew I could count on you, $p. You always come to help when Azeroth is in danger.$b$bNow, let''s get to work.' WHERE `ID` = 50056;
UPDATE `quest_offer_reward` SET `RewardText` = 'The sword is darkening! I can feel Azeroth''s suffering easing... if only slightly.$b$bYou did well. You''ve bought us some time.$b$bBut we must find a way to heal this wound completely. Whatever happens between the Horde and the Alliance, our duty to Azeroth comes first!' WHERE `ID` = 50057;
UPDATE `quest_offer_reward` SET `RewardText` = 'Get to it, $n. Stormwind thanks you for your service.' WHERE `ID` = 50248;
UPDATE `quest_request_items` SET `CompletionText` = 'Thank you, $c. Today you can count on our help. Every one of us is ready to shed blood for you.' WHERE `ID` = 24507;
UPDATE `quest_request_items` SET `CompletionText` = 'What''s happening hot stuff? Got something for me?' WHERE `ID` = 29396;
UPDATE `quest_request_items` SET `CompletionText` = 'Harrumph!' WHERE `ID` = 30475;
UPDATE `quest_request_items` SET `CompletionText` = 'Bones, bones, bones, bones, bones...' WHERE `ID` = 32614;
UPDATE `quest_request_items` SET `CompletionText` = 'Too many, too few, no, no... Give them to Ku''ma...' WHERE `ID` = 32615;
UPDATE `quest_request_items` SET `CompletionText` = 'You afraid of death? Heh heh...' WHERE `ID` = 32616;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you explored the island yet?' WHERE `ID` = 33161;
UPDATE `quest_request_items` SET `CompletionText` = 'What have you got there?' WHERE `ID` = 33234;
UPDATE `quest_request_items` SET `CompletionText` = 'Smells... interesting...' WHERE `ID` = 33235;
UPDATE `quest_request_items` SET `CompletionText` = 'What''s that smell? Like a bloody yak flank.' WHERE `ID` = 33236;
UPDATE `quest_request_items` SET `CompletionText` = 'What is that divine smell?' WHERE `ID` = 33239;
UPDATE `quest_request_items` SET `CompletionText` = 'Lok''tar, traveler.' WHERE `ID` = 33546;
UPDATE `quest_request_items` SET `CompletionText` = 'I will need those hearts, $C.' WHERE `ID` = 33661;
UPDATE `quest_request_items` SET `CompletionText` = 'Today we fight not for the glory of the Horde, but for the holy Light.' WHERE `ID` = 34418;
UPDATE `quest_request_items` SET `CompletionText` = 'A blademaster without a blade is no blademaster at all.' WHERE `ID` = 34849;
UPDATE `quest_request_items` SET `CompletionText` = 'Laughing Skull have some dirty tricks behind our masks.' WHERE `ID` = 35038;
UPDATE `quest_request_items` SET `CompletionText` = 'Heh heh.' WHERE `ID` = 35487;
UPDATE `quest_request_items` SET `CompletionText` = 'What we need are saplings of hope. Get it?!' WHERE `ID` = 35506;
UPDATE `quest_request_items` SET `CompletionText` = 'Any luck? I couldn''t find anything.' WHERE `ID` = 35924;
UPDATE `quest_request_items` SET `CompletionText` = 'Scout Pazerp still hasn''t come back.' WHERE `ID` = 36382;
UPDATE `quest_request_items` SET `CompletionText` = 'You came all this way just to find me? Well, I can''t say I''m surprised. I am kind of a big deal.' WHERE `ID` = 36608;
UPDATE `quest_request_items` SET `CompletionText` = 'Any luck near those lava pools?' WHERE `ID` = 36612;
UPDATE `quest_request_items` SET `CompletionText` = 'Well, would you look at that! What a giant fish, $n! A real monster! I don''t think I''ll ever get used to fishing in lava instead of water. What an incredible place.' WHERE `ID` = 36800;
UPDATE `quest_request_items` SET `CompletionText` = 'I know it might sound silly... but I always believed Grandfather would be with us until the end of time.' WHERE `ID` = 37853;
UPDATE `quest_request_items` SET `CompletionText` = 'I still don''t trust him.' WHERE `ID` = 37857;
UPDATE `quest_request_items` SET `CompletionText` = 'Well, any luck?' WHERE `ID` = 38312;
UPDATE `quest_request_items` SET `CompletionText` = 'A giant sea scorpion?' WHERE `ID` = 38406;
UPDATE `quest_request_items` SET `CompletionText` = 'Come up with anything interesting?' WHERE `ID` = 38499;
UPDATE `quest_request_items` SET `CompletionText` = 'I still can''t understand how those creatures manage to swim in plate armor.' WHERE `ID` = 38501;
UPDATE `quest_request_items` SET `CompletionText` = 'Hopefully we can extract something useful.' WHERE `ID` = 38502;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m waiting, outsider.' WHERE `ID` = 38514;
UPDATE `quest_request_items` SET `CompletionText` = 'Keep it up, $C.' WHERE `ID` = 38528;
UPDATE `quest_request_items` SET `CompletionText` = 'Remember, $n: I do not tolerate sloppy work.' WHERE `ID` = 38531;
UPDATE `quest_request_items` SET `CompletionText` = 'I will build everything for you.' WHERE `ID` = 38572;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you get the harpoon?' WHERE `ID` = 38612;
UPDATE `quest_request_items` SET `CompletionText` = 'What have we here?' WHERE `ID` = 38616;
UPDATE `quest_request_items` SET `CompletionText` = 'So, how are things going?' WHERE `ID` = 38644;
UPDATE `quest_request_items` SET `CompletionText` = 'We must hurry.' WHERE `ID` = 38669;
UPDATE `quest_request_items` SET `CompletionText` = 'What have you got there, $n?' WHERE `ID` = 38688;
UPDATE `quest_request_items` SET `CompletionText` = 'Destroy the giants and take the Seals.' WHERE `ID` = 38723;
UPDATE `quest_request_items` SET `CompletionText` = 'What''ve ye brought me now?' WHERE `ID` = 38784;
UPDATE `quest_request_items` SET `CompletionText` = 'Oh, my...' WHERE `ID` = 38785;
UPDATE `quest_request_items` SET `CompletionText` = 'What''s that?' WHERE `ID` = 38797;
UPDATE `quest_request_items` SET `CompletionText` = 'Forgive me for not saluting you, $n. I am occupied with the ritual.' WHERE `ID` = 39049;
UPDATE `quest_request_items` SET `CompletionText` = 'So, is the ship under construction yet?' WHERE `ID` = 39242;
UPDATE `quest_request_items` SET `CompletionText` = 'We await your orders, $n.' WHERE `ID` = 39516;
UPDATE `quest_request_items` SET `CompletionText` = 'Any luck retrieving my hammer?' WHERE `ID` = 39680;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the Heart of Chaos?' WHERE `ID` = 39683;
UPDATE `quest_request_items` SET `CompletionText` = 'Freedom comes at a high price.' WHERE `ID` = 39694;
UPDATE `quest_request_items` SET `CompletionText` = 'I''m waiting, outsider.' WHERE `ID` = 39699;
UPDATE `quest_request_items` SET `CompletionText` = 'Your weapon holds immense untapped potential. Return when it has consumed more souls.' WHERE `ID` = 39761;
UPDATE `quest_request_items` SET `CompletionText` = 'Greetings, $ct.' WHERE `ID` = 39799;
UPDATE `quest_request_items` SET `CompletionText` = 'Why are you just standing there gawking? Help me!' WHERE `ID` = 39838;
UPDATE `quest_request_items` SET `CompletionText` = 'What, are you afraid of the dark?' WHERE `ID` = 39860;
UPDATE `quest_request_items` SET `CompletionText` = 'Any luck finding those books, $n?' WHERE `ID` = 40031;
UPDATE `quest_request_items` SET `CompletionText` = 'Keep going, herbalist.' WHERE `ID` = 40035;
UPDATE `quest_request_items` SET `CompletionText` = 'Oh, you''re back...' WHERE `ID` = 40043;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you made your choice?' WHERE `ID` = 40373;
UPDATE `quest_request_items` SET `CompletionText` = 'Those damned harpies ambushed Jabrul!' WHERE `ID` = 40535;
UPDATE `quest_request_items` SET `CompletionText` = 'I''d recommend keeping a steadier hand than usual with these jewels.' WHERE `ID` = 40538;
UPDATE `quest_request_items` SET `CompletionText` = 'Found what''cha need yet?' WHERE `ID` = 40856;
UPDATE `quest_request_items` SET `CompletionText` = 'Those mean greenies''ll regret messin'' wit'' me machine guns!' WHERE `ID` = 40861;
UPDATE `quest_request_items` SET `CompletionText` = 'Hopefully it''s not too much trouble finding a suitable power source.' WHERE `ID` = 40863;
UPDATE `quest_request_items` SET `CompletionText` = 'I had a whole heap of ideas, but I only managed to write down a couple of the most interesting ones.' WHERE `ID` = 40864;
UPDATE `quest_request_items` SET `CompletionText` = 'If I ever get my hands on those kids...' WHERE `ID` = 40870;
UPDATE `quest_request_items` SET `CompletionText` = 'The Terrace of Endless Spring is a sacred place to the mainland pandaren. I hope you were able to protect it from corruption. Too much of Pandaria was already destroyed when Garrosh Hellscream brought war to its shores.' WHERE `ID` = 41003;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you brought what we asked for?' WHERE `ID` = 41223;
UPDATE `quest_request_items` SET `CompletionText` = 'Are you here to deliver the supplies?' WHERE `ID` = 41288;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you come to help the Dreamweavers?' WHERE `ID` = 41293;
UPDATE `quest_request_items` SET `CompletionText` = 'Are you here to deliver the supplies?' WHERE `ID` = 41315;
UPDATE `quest_request_items` SET `CompletionText` = 'Are you here to deliver the supplies?' WHERE `ID` = 41327;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you manage to get G''Hanir?' WHERE `ID` = 41436;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you bring the bracers I asked for?' WHERE `ID` = 41641;
UPDATE `quest_request_items` SET `CompletionText` = 'Greetings, leatherworker. I understand you''ve seen our work order. Do you have the gloves?' WHERE `ID` = 41644;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you bring the item I asked for?' WHERE `ID` = 41647;
UPDATE `quest_request_items` SET `CompletionText` = 'Hello, tailor. I understand you''ve completed our work order. Do you have the hood?' WHERE `ID` = 41650;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you bring the pendant I asked for?' WHERE `ID` = 41653;
UPDATE `quest_request_items` SET `CompletionText` = 'Hello, jewelcrafter. I understand you''ve completed our work order. Do you have the ring?' WHERE `ID` = 41656;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you come to help the Dreamweavers?' WHERE `ID` = 41658;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you brought what we asked for?' WHERE `ID` = 41659;
UPDATE `quest_request_items` SET `CompletionText` = 'Greetings, alchemist. I understand you''ve seen our work order. Do you have the potions?' WHERE `ID` = 41662;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you brought us the supplies?' WHERE `ID` = 41663;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you come to help the Dreamweavers?' WHERE `ID` = 41664;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you brought what we asked for?' WHERE `ID` = 41665;
UPDATE `quest_request_items` SET `CompletionText` = 'Greetings, scribe. I understand you''ve seen our work order. Do you have the supplies?' WHERE `ID` = 41668;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you come to help the Dreamweavers?' WHERE `ID` = 41670;
UPDATE `quest_request_items` SET `CompletionText` = 'Do you have the supplies we asked for?' WHERE `ID` = 41671;
UPDATE `quest_request_items` SET `CompletionText` = 'Greetings, enchanter. I understand you''ve seen our work order. Do you have the enchantments?' WHERE `ID` = 41674;
UPDATE `quest_request_items` SET `CompletionText` = 'Hello, engineer. I understand you''ve seen our work order. Do you have the pylon?' WHERE `ID` = 41680;
UPDATE `quest_request_items` SET `CompletionText` = 'Do we have enough intelligence on the Legion''s forces at the Gates of Valor?' WHERE `ID` = 41909;
UPDATE `quest_request_items` SET `CompletionText` = 'The time has come for you to follow your destiny, Farseer $n.' WHERE `ID` = 42114;
UPDATE `quest_request_items` SET `CompletionText` = 'I understand why those hideous murlocs deck themselves out in trinkets...' WHERE `ID` = 42214;
UPDATE `quest_request_items` SET `CompletionText` = 'How''s old Baron holding up?' WHERE `ID` = 42398;
UPDATE `quest_request_items` SET `CompletionText` = 'Well, what did you find?' WHERE `ID` = 42433;
UPDATE `quest_request_items` SET `CompletionText` = 'Did Archmage Lan''dalock prove useful, $n?' WHERE `ID` = 42594;
UPDATE `quest_request_items` SET `CompletionText` = 'Greetings.' WHERE `ID` = 42610;
UPDATE `quest_request_items` SET `CompletionText` = 'What are you waiting for? Decipher the message.' WHERE `ID` = 42680;
UPDATE `quest_request_items` SET `CompletionText` = 'We must throw SI:7 off our trail with false leads and diversions.' WHERE `ID` = 42684;
UPDATE `quest_request_items` SET `CompletionText` = 'Are you sure you''ve dealt with the moths?' WHERE `ID` = 42836;
UPDATE `quest_request_items` SET `CompletionText` = 'Any bites out there?' WHERE `ID` = 42911;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get the supplies?' WHERE `ID` = 42928;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get the supplies?' WHERE `ID` = 42929;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get the supplies?' WHERE `ID` = 42930;
UPDATE `quest_request_items` SET `CompletionText` = 'I am pleased with you.' WHERE `ID` = 42987;
UPDATE `quest_request_items` SET `CompletionText` = 'Such an egg is highly prized, mortal. But the hunger torments me so...$B$BThis bargain will cost you... dearly.$B$BBring me 5 Blood of Sargeras, and I will give you the egg.' WHERE `ID` = 42995;
UPDATE `quest_request_items` SET `CompletionText` = 'I see you''ve managed to win Mr. Wolfe over to our side. We transferred a whole heap of gold to his account, which surely helped.' WHERE `ID` = 43015;
UPDATE `quest_request_items` SET `CompletionText` = 'This tasty fish can be found in the waters of Highmountain. Fishing can be a very profitable pursuit. They say many anglers sell their catch.' WHERE `ID` = 43060;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get the bandages?' WHERE `ID` = 43061;
UPDATE `quest_request_items` SET `CompletionText` = 'Have I piqued your interest?' WHERE `ID` = 43249;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find the proof?' WHERE `ID` = 43253;
UPDATE `quest_request_items` SET `CompletionText` = 'Has Dark Summoner Marogh begun his work?' WHERE `ID` = 43266;
UPDATE `quest_request_items` SET `CompletionText` = 'So, how goes the effort to unite the factions?' WHERE `ID` = 43341;
UPDATE `quest_request_items` SET `CompletionText` = 'Do ya have our supplies?' WHERE `ID` = 43375;
UPDATE `quest_request_items` SET `CompletionText` = 'We watch over Natalie''s body, forever hopeful that her spirit will return.' WHERE `ID` = 43391;
UPDATE `quest_request_items` SET `CompletionText` = 'This is no time for distractions, $n. The council needs to draw up a plan of action.' WHERE `ID` = 43397;
UPDATE `quest_request_items` SET `CompletionText` = 'This is only the first step toward unlocking your artifact''s true potential, but the results are impressive.' WHERE `ID` = 43519;
UPDATE `quest_request_items` SET `CompletionText` = 'Today the lessons of the past are more valuable than ever: our future depends on them. This is very important research.' WHERE `ID` = 43877;
UPDATE `quest_request_items` SET `CompletionText` = 'The price is twice what it was last time. But you know best. Or perhaps you''d rather pay in a different currency? The choice is yours.

Remember: only three seals per week. This is one of them. You''ll get more next week.' WHERE `ID` = 43893;
UPDATE `quest_request_items` SET `CompletionText` = 'These seals improve your chances of extra loot in dungeons and raids, but at what cost? Gold is a treasure in itself, but what if it could bring you even more treasure? That is my offer.

Remember: only three seals per week. This is one of them. You''ll get more next week.' WHERE `ID` = 43895;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get the supplies?' WHERE `ID` = 43923;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get the supplies?' WHERE `ID` = 43924;
UPDATE `quest_request_items` SET `CompletionText` = 'Were you able to get the supplies?' WHERE `ID` = 43925;
UPDATE `quest_request_items` SET `CompletionText` = 'Have you found out who was behind the assassination attempt?' WHERE `ID` = 44041;
UPDATE `quest_request_items` SET `CompletionText` = 'Have ye got th'' spiced rum?' WHERE `ID` = 44117;
UPDATE `quest_request_items` SET `CompletionText` = 'Have ye found any clues? Be th'' pirates tied ta this murder?' WHERE `ID` = 44155;
UPDATE `quest_request_items` SET `CompletionText` = 'This alignment of the stars is a dire sign, stirring bloodlust and calling warriors to battle to the death in close quarters. Arena masters turn a tidy profit during these days, likely not understanding why their stands are overflowing. Amidst the excitement, great rewards do await those brave, or foolhardy, enough to venture into the arena...' WHERE `ID` = 44172;
UPDATE `quest_request_items` SET `CompletionText` = 'Place a work order for a Seal of Broken Fate.' WHERE `ID` = 44204;
UPDATE `quest_request_items` SET `CompletionText` = 'Channel the power of Dalaran into the Focusing Crystal and release it to complete a local world quest.' WHERE `ID` = 44209;
UPDATE `quest_request_items` SET `CompletionText` = 'How''s that technique coming along?' WHERE `ID` = 44449;
UPDATE `quest_request_items` SET `CompletionText` = 'Blood is the source of life and the fuel for my creations. Unfortunately, my supplies are running low, and the quality of the blood has been disappointing lately, to say the least.$b$bFor my undead to reach their full potential, I need pure, high-quality blood. Bring me Blood of Sargeras, and with it I will "revive" my finest creations.' WHERE `ID` = 44690;
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find the fragments?' WHERE `ID` = 44734;
UPDATE `quest_request_items` SET `CompletionText` = 'Well, did you get it all done?' WHERE `ID` = 45073;
UPDATE `quest_request_items` SET `CompletionText` = 'Stop wandering around! Help me sort out this ritual!' WHERE `ID` = 45125;
UPDATE `quest_request_items` SET `CompletionText` = 'So, how are things on the battlefield?' WHERE `ID` = 45172;
UPDATE `quest_request_items` SET `CompletionText` = 'So, how do you like the battlefield?' WHERE `ID` = 45173;
UPDATE `quest_request_items` SET `CompletionText` = 'I''ll do whatever it takes to find a cure for this plague.' WHERE `ID` = 45347;
UPDATE `quest_request_items` SET `CompletionText` = 'What do we have here?' WHERE `ID` = 45348;
UPDATE `quest_request_items` SET `CompletionText` = 'Thank you for answering the call.' WHERE `ID` = 45372;
UPDATE `quest_request_items` SET `CompletionText` = 'This harness will bring us great power!' WHERE `ID` = 45398;
UPDATE `quest_request_items` SET `CompletionText` = 'Has our squad returned from its scouting mission yet?' WHERE `ID` = 45975;
UPDATE `quest_request_items` SET `CompletionText` = 'Has our squad returned from its scouting mission yet?' WHERE `ID` = 46031;
UPDATE `quest_request_items` SET `CompletionText` = 'Seek out Leafbeard the Storied.' WHERE `ID` = 46786;
UPDATE `quest_request_items` SET `CompletionText` = 'Well, have you found new allies?' WHERE `ID` = 47137;
UPDATE `quest_request_items` SET `CompletionText` = 'These seals improve your chances of extra loot in dungeons and raids, but at what cost? Of course, your class can spare these resources, but I can''t help but ask: when will it end? When will you stop risking the lives of others for your own greed?

You can only receive three seals per week. This is one of them. You''ll get more next week.' WHERE `ID` = 47851;
UPDATE `quest_request_items` SET `CompletionText` = 'These seals improve your chances of extra loot in dungeons and raids, but at what cost? Of course, your class can spare these resources, but I can''t help but ask: when will it end? When will you stop risking the lives of others for your own greed?

You can only receive three seals per week. This is one of them. You''ll get more next week.' WHERE `ID` = 47864;
UPDATE `quest_request_items` SET `CompletionText` = 'These seals improve your chances of extra loot in dungeons and raids, but at what cost? Of course, your class can spare these resources, but I can''t help but ask: when will it end? When will you stop risking the lives of others for your own greed?

You can only receive three seals per week. This is one of them. You''ll get more next week.' WHERE `ID` = 47865;
UPDATE `quest_request_items` SET `CompletionText` = 'Are your warriors ready for the coming battle, $n?' WHERE `ID` = 48442;
UPDATE `quest_request_items` SET `CompletionText` = 'What have ye got for me?' WHERE `ID` = 50047;
UPDATE `quest_request_items` SET `CompletionText` = 'This compass once belonged to my great-grandfather. I think it''s only fair that you give it to me, and in return I''ll tell you what you want to know.' WHERE `ID` = 90005;
UPDATE `quest_template` SET `LogTitle` = 'A Timely Opportunity' WHERE `ID` = 40312;
UPDATE `quest_template` SET `LogTitle` = 'Slippery Seal Hide' WHERE `ID` = 41325;
UPDATE `quest_template` SET `LogTitle` = 'Roc Talon Scale' WHERE `ID` = 41577;
UPDATE `quest_template` SET `LogTitle` = 'Huge Highmountain Salmon' WHERE `ID` = 41608;
UPDATE `quest_template` SET `LogTitle` = 'There Will Be No Holiday!' WHERE `ID` = 90000;
UPDATE `quest_template` SET `LogTitle` = 'The Story of the New Year' WHERE `ID` = 90001;
UPDATE `quest_template` SET `LogTitle` = 'Materials' WHERE `ID` = 90002;
UPDATE `quest_template` SET `LogTitle` = 'A Forgotten Detail' WHERE `ID` = 90003;
UPDATE `quest_template` SET `LogTitle` = 'Even Criminals Celebrate' WHERE `ID` = 90004;
UPDATE `quest_template` SET `LogTitle` = 'Energy Surge Detected!' WHERE `ID` = 90005;
UPDATE `quest_template` SET `LogTitle` = 'In Search of Shakro' WHERE `ID` = 90006;
UPDATE `quest_template` SET `LogTitle` = 'Saving the New Year' WHERE `ID` = 90007;
UPDATE `quest_template` SET `LogDescription` = 'Assist Spiritwalker Ebonhorn in Neltharion''s Lair.' WHERE `ID` = 40312;
UPDATE `quest_template` SET `LogDescription` = 'Find Albond in Shadowmoon Valley.' WHERE `ID` = 90000;
UPDATE `quest_template` SET `LogDescription` = 'Listen to Albond''s story.' WHERE `ID` = 90001;
UPDATE `quest_template` SET `LogDescription` = 'Bring the ingredients to Albond.' WHERE `ID` = 90002;
UPDATE `quest_template` SET `LogDescription` = 'Find the goblin Kaltas and obtain the Thornwood Stone from him.' WHERE `ID` = 90003;
UPDATE `quest_template` SET `LogDescription` = 'Bring the goblin the items he needs.' WHERE `ID` = 90004;
UPDATE `quest_template` SET `LogDescription` = 'Travel to Booty Bay and question the tavern keeper.' WHERE `ID` = 90005;
UPDATE `quest_template` SET `LogDescription` = 'Shakro is somewhere in Auchindoun. Find him!' WHERE `ID` = 90006;
UPDATE `quest_template` SET `LogDescription` = 'Travel to the Howling Fjord and save the New Year!' WHERE `ID` = 90007;
UPDATE `quest_template` SET `QuestDescription` = 'Now that we''ve dealt with this "spirit walk," we can get down to business.' WHERE `ID` = 40312;
UPDATE `quest_template` SET `QuestDescription` = 'A great misfortune has befallen our lands. The New Year has been stolen! And no one knows how this will affect the fate of all Azeroth!
$c, if you are willing to help us, to help all of Azeroth, you must find out who stole the holiday.

Rumor has it that a mage named Albond is currently in Shadowmoon Valley, in Outland.
Albond is a descendant of the great alchemist Parneti, who created the New Year several thousand years ago. I think he can help us.

Be careful with him. I''ve heard he''s a bit strange.' WHERE `ID` = 90000;
UPDATE `quest_template` SET `QuestDescription` = 'Ah, you again. I knew Greatfather Winter''s lackeys would send someone to me, for I am the only one who might know anything about this.
Shall I tell you a little story?' WHERE `ID` = 90001;
UPDATE `quest_template` SET `QuestDescription` = 'Building the device will require several ingredients.
The heart of a Nexus whelp, found in the Borean Tundra; 6 handfuls of first snow from Winterspring; and some magical water from Lake Elune''ara, which you can obtain by asking Keeper Remulos nicely.' WHERE `ID` = 90002;
UPDATE `quest_template` SET `QuestDescription` = 'Oh, my memory isn''t what it used to be. I forgot one more part for our marvelous device. The Thornwood Stone!

There''s a goblin who hangs around the Swamp of Sorrows. He has what we need... the Thornwood Stone, imbued with ancient magic. We can''t do without it. The goblin''s name is Kaltas. I think you''ll find him quickly.' WHERE `ID` = 90003;
UPDATE `quest_template` SET `QuestDescription` = 'The Thornwood Stone, you say? Yeah, I''ve got it, but I''m not just gonna hand it over.

I''ve been wanting to try some Ice Cold Milk and Gingerbread Cookies for ages, but I don''t have a moment to spare right now. I''m running around like a hamster on a wheel all day with these contract killings and other dirty business.

By the way, the scope on my rifle broke the other day, and what good is an assassin without optics? I hear the Khorium Scope is a great model, so you''ll have to find me one of those too, and then I''ll give you the stone.' WHERE `ID` = 90004;
UPDATE `quest_template` SET `QuestDescription` = 'The compass lit up the sky with a blue glow. The image was perfectly sharp, as if painted. I can see a pier, houses, a tavern. That''s none other than Booty Bay. We need to go there and question the locals. I think the tavern keeper must know something.' WHERE `ID` = 90005;
UPDATE `quest_template` SET `QuestDescription` = 'The one you''re looking for came by yesterday. His name is Shakro. He deals with imps, or demons... I don''t really know. He wanted me to help him find some mercenaries... said he was in some kind of danger. Of course I turned him down. I gave up all that shady business a long time ago.
He left me a clue on how to find him. Said he''d be somewhere in Auchindoun, but didn''t say exactly where.' WHERE `ID` = 90006;
UPDATE `quest_template` SET `QuestDescription` = 'Very strange. The letter says that "Winter" has been ordered to destroy the artifact, since the demons in this world lacked the strength to destroy it themselves.
But how is that possible? Has "Winter" betrayed the spirit of the New Year? Something isn''t right here. Perhaps his mind has been seized by the enemy?

The artifact can only be destroyed in the place where it was created. In the mountains of the Howling Fjord! Let''s hurry!' WHERE `ID` = 90007;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Chris Clarkie at the Alliance base in Ashran.' WHERE `ID` = 38925;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Chris Clarkie at the Alliance base in Ashran.' WHERE `ID` = 39522;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Speak with Wrathion in Neltharion''s Lair.' WHERE `ID` = 40312;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Albond' WHERE `ID` = 90003;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Kaltas' WHERE `ID` = 90004;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Speak with Dionis' WHERE `ID` = 90005;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Take the letter to Albond' WHERE `ID` = 90006;
UPDATE `quest_template` SET `QuestCompletionLog` = 'Receive your gift' WHERE `ID` = 90007;
UPDATE `quest_template` SET `AreaDescription` = 'Albond found' WHERE `ID` = 90000;
UPDATE `quest_template` SET `AreaDescription` = 'Listen to the old mage''s story' WHERE `ID` = 90001;
UPDATE `quest_template` SET `AreaDescription` = 'Return to Albond with the ingredients.' WHERE `ID` = 90002;
UPDATE `quest_template` SET `AreaDescription` = 'Tavern keeper questioned' WHERE `ID` = 90005;
UPDATE `quest_template` SET `AreaDescription` = 'New Year saved' WHERE `ID` = 90007;
