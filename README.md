Research question-
Are the actor's age and acting ability related?

overture-
Adolescence and aging are a natural part of the world, we grow, develop and learn new things all the time, especially at younger ages.
It is known that at younger ages (3-12) the brain and body are more flexible to changes - such as for example learning a new language or learning a new and complicated physical ability.
In the world, when people start talking about the aging process, the age in question is around the middle of the 20s, and more precisely the age of 25.
The age of 25 is the average age at which the human body seems to begin to age, be it the beginning of wrinkles or folds, the beginning of white hairs, the body becomes less flexible and more tired, etc.
In the wider gaming world, age 25 is the retirement age for many players (professional players) regardless of level or apparent playing ability.
The claim is that at the age of 25, when the body begins its aging process, the brain also participates in the process, and therefore the ability to process information and reactions and instincts become slow, therefore many companies prefer to train and find new young and talented players to replace the "old generation".

In this project we want to search: Is there really a connection between playing ability and age?

We found our data on the website: https://www.kaggle.com/danofer/skillcraft

The data is about a famous and relatively old game that is still played by thousands every day.
The game is called starcraft 2 - in which the players alone (or in a group game) have to perform a variety of actions, some complicated and some less so, in order to explore the map to build and create soldiers, workers, towers, mine resources for them and find the enemy's base to defeat his army and conquer his base.



Attribute Information:
1.	GameID: Unique ID number for each game (integer) 
2.	LeagueIndex: Bronze, Silver, Gold, Platinum, Diamond, Master, GrandMaster, and Professional leagues coded 1-8 (Ordinal) 
3.	Age: Age of each player (integer) 
4.	HoursPerWeek: Reported hours spent playing per week (integer) 
5.	TotalHours: Reported total hours spent playing (integer) 
6.	APM: Action per minute (continuous) 
7.	SelectByHotkeys: Number of unit or building selections made using hotkeys per timestamp (continuous) 
8.	AssignToHotkeys: Number of units or buildings assigned to hotkeys per timestamp (continuous) 
9.	UniqueHotkeys: Number of unique hotkeys used per timestamp (continuous) 
10.	MinimapAttacks: Number of attack actions on minimap per timestamp (continuous) 
11.	MinimapRightClicks: number of right-clicks on minimap per timestamp (continuous) 
12.	NumberOfPACs: Number of PACs per timestamp (continuous) 
13.	GapBetweenPACs: Mean duration in milliseconds between PACs (continuous) 
14.	ActionLatency: Mean latency from the onset of a PACs to their first action in milliseconds (continuous) 
15.	ActionsInPAC: Mean number of actions within each PAC (continuous) 
16.	TotalMapExplored: The number of 24x24 game coordinate grids viewed by the player per timestamp (continuous) 
17.	WorkersMade: Number of SCVs, drones, and probes trained per timestamp (continuous) 
18.	UniqueUnitsMade: Unique unites made per timestamp (continuous) 
19.	ComplexUnitsMade: Number of ghosts, infestors, and high templars trained per timestamp (continuous) 
20.	ComplexAbilitiesUsed: Abilities requiring specific targeting instructions used per timestamp (continuous)



Starting the study:

We started with a general look at our information, and decided to look not only at the original information table, but also to split the table into 2.
By age - 25 and over, under 25.
We saw from the split that 20% of the players are 25 years old or older, 80% are younger than 25.
We assume from this that there will be more young players than adults in the major leagues since they are the majority of the population in the game.
There are 8 leagues - 7 leagues are indicated in the information table.
A high level player is considered from league 5 and above, while leagues 1-4 are the lower levels.

For each age table we counted how many of them belong to high leagues and how many belong to low leagues.
According to our assumptions:
In the adult group - 32% play in league 5 or higher and 68% play in the lower leagues.
In the youth group - 47% play in the higher leagues and 53% play in the lower leagues.

It is also easy to see that the youth group is divided almost half and half between the high and low leagues compared to the adults.
We wanted to look deeper, are there more young players in the higher leagues because of the inclusion of the leagues?
Will we get different results when we look at several leagues separately?

We looked at the lowest and highest league (Ligue 7 and League 1) that exists in our information.
Results in relation to the overall table:
League 1:
67% are young players and 33% are older players

League 7:
88% are young players and 12% are older players

In relation to each age group:
League 1-
About 4% of all young players
About 8% of the total adult players

League 7-
About 1% of all young players
About half a percent of all adult players


Results from the overall table did not provide new information.
According to the assumptions and conclusions until now, this is roughly the split of players we expected - more young people than adults play in the top league.



Results from the tables by age group-
After dividing and analyzing the data, it can be seen in accordance with all the leagues - the same ratio of the general population between the older and younger players is distributed in a very similar way between the different leagues.
There is a higher amount of players in the lower league than in the higher league, in addition the number of players in the higher league is very small in relation to the age group.

Now we decided to test another characteristic in the context of age and league.
According to the PCA model, on the overall table, we tested correlations between different characteristics in the information.

![Uploading 1.png…]()
We can seen that there is a correlation between the age and the average in milliseconds between pac that there is a correlation with the league's affinity and a characteristic - apm number of operations per second and between them there seems to be an anti-correlation relationship. The lower the age, the higher you will be in the league and the greater the number of your actions per second.

pac: The amount of time it takes for the player to perform a new action since he scrolled the screen / moved the screen to a new location and began performing his first action on the "new" screen.
It seems that as the number of clicks per second increases, the average between the pac also decreases. In addition, there is a correlation between the average between the pac and the average of the seconds between the start of the pac and the first action. We note that most actions will require more than one click, either with the mouse, the keyboard, or both, and that exploring the map requires a large amount of clicks as well. In addition, you can see that there is no connection between the age, the number of clicks and the league and a number of the actions that are indicated to us in the information and between which there is a correlation.

These actions usually require more from the player and happen one after the other. We will also notice that there is an anti-correlation between the number of hours of play and age - the younger the age, the number of hours of play increases, which could be assumed alone - adults have more responsibility during the day than young players.
After this analysis, it was decided to refer to the number of clicks per second and check how it varies between leagues and age. We calculated the average clicks per second for each age group league.


![2](https://github.com/oshritmau/blizzard/assets/48522958/c97288e4-307e-4275-b1ff-c028b556f839)

Results:
In the younger group, you see a more even increase - the more you advance in the rank, the more the amount of pressure increases. In the adult group, you can see the changes in the number of clicks in the different leagues - the increase in the number of clicks is not as uniform as in the youth group. It can also be noticed that both teams have a sharper increase around league 4-5 which is exactly the transition to the higher leagues as we shared at the beginning.
As you can see the number of clicks in the youth group is greater than that in the adult group throughout the leagues
As expected according to the information we have concluded so far, but we will notice a surprising figure - in league number 7 - (the highest league in our information) the number of clicks per second in the adult group increases significantly and even overtakes that of the youth group.

Continuing with the new and surprising figure, we tried to check correlations according to age groups with the help of pca￼￼ 
Age group 25 and over:
![3](https://github.com/oshritmau/blizzard/assets/48522958/4642ecd8-4b76-42b2-b200-54983d42b785)

Results:
Age is not found in direct anti-correlation (they influence each other less) with the number of clicks per second or with the league ranking (which remained correlated with each other)
Certain actions that previously seemed unaffected by age are now in an anti-correlation relationship with it - the higher the age, the less "difficult" actions you will do. Age does not affect the amount of game hours. Age remained correlated with the average milliseconds between the start of the pac and the first action.

Age group under 25:
![4](https://github.com/oshritmau/blizzard/assets/48522958/edc865ff-08a9-4fd4-bcef-7c76eaa1d8b8)

Results:
The number of clicks per second is still correlated with the league ranking. Age does not affect the league ranking, the time between the pac, the time between the start of the pac and the first action, but is in an anti-correlation relationship with the amount of actions in each pac - as the age increases, the amount of actions in each pac decreases. There is a correlation between age and a number of more complicated and special operations.

Before drawing our final conclusions we will examine separately the last league and the first league: 
League 1:
![5](https://github.com/oshritmau/blizzard/assets/48522958/abfc38b2-2a4f-4e59-b3da-fecd49a90ce6)

Results:
There seems to be no relationship between age and more complicated actions in the game. There is still an anti-correlation relationship between age and the number of clicks per second. Most of the clicks are for simple and basic in-game actions like creating workers or tagging creatures. The hours of play are correlated with the special and complicated actions - there is no connection between the hours of play and age. The age is correlated in the interval between pac.

League 7:
![6](https://github.com/oshritmau/blizzard/assets/48522958/402e3330-5738-4908-aefe-3b74edd0f630)

Results:
Age has no effect on performing more complicated and special actions like on some of the actions within a pack. Age is in anti-correlation with the number of hours of play and more basic actions, as well as age is also in anti-correlation with the number of clicks per second. That is to say, the younger the age, the more basic actions the player will perform and thus the number of clicks will increase. Age is still correlated with the origin of the milliseconds from the start of the pac until the first action.

Conclusions: As expected from a starting player in League 1, there is more use of basic actions
League 7:
￼￼￼￼￼
And the more hours you have playing and understanding it, the more the player tries and experiments with new, more complicated and special actions. League 1 is the league you start in, so it depends on the player, regardless of age, whether this is the game in which you will spend most of your free time -
Young people and adults together tend to play several games at the same time or in groups with friends from school or work, therefore playing hours can be affected by many environmental factors regardless of age. The game has a purpose and it is necessary to have a basic understanding of what is currently happening in the game and to understand what needs to be done to reach a desired result. This understanding does not necessarily depend on the age of the player, young players can learn from videos of older and more experienced players, younger players can think of new strategies and older players can solve new problems faster and better. In the higher league you can also see that younger players play more hours compared to older players but still both types of players are in the higher league.
Younger players tend to press more and this can be for a variety of reasons, one of which could be that they tend to do more basic actions, meaning that older players play no less well than young players with fewer total actions but with more special/complicated actions. (like winning a pinball game in 5 minutes and 20 moves and winning a chess game in 5 minutes and 100 moves)

Final conclusions and results:
We were not able to answer the original research question but we reached new results and conclusions. There are many factors that affect a player's playing ability. It seems that even at "adult" ages you have the ability to be a very high level player. Companies that train professional players have many reasons to retire "older" players (desire to do something else in life such as study, they need to be paid more, it's hard for them to sit all day playing, have stronger opinions, etc.) and not because their playing ability has decreased.
We have seen that in order to reach a high level of play you need to be a good strategist, have a good level of instincts and sometimes a good team member, the amount of clicks does not always mean how good or bad a player you are but which of the activities were done or in which direction they affect, like a game of chess it also depends on the opponent. We will not be able to determine unequivocally according to the data regarding the players' achievements whether the player's age affects his playing ability since the game is affected by many factors that are not necessarily interdependent.








