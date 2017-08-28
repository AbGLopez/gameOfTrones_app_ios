//
//  Repository.swift
//  west
//
//  Created by abraham on 11/7/17.
//
//

import Foundation


final class Repository{
    
    static let local = LocalFactory()
    // esto me devuelve un objeto que va a ser local y otro que sera remoto

}

// Mark: - HouseFactory

protocol HouseFactory {
    typealias Filter = (House) -> Bool
    typealias FilterSeason = (Season) -> Bool
    
    var houses : [House] {get}
    var seasons : [Season] {get}
    
    // me da el modelo segun su nombre
    func house(named: String)->House?
    func season(named : String) -> Season?
 
    // Función que trata de obtener modelos filtrados por algun criterio.
    
    func seasons(filteredBy: FilterSeason) -> [Season]
    func houses(filteredBy:Filter) -> [House]

}


final class LocalFactory : HouseFactory {
    
    var houses: [House]{
        get{
            // Aquí te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
          
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampan Lion")
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php//House_Startk")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let mormontURL      = URL(string: "https://awoiaf.westeros.org/index.php/House_Mormont")!
            let greyjoyURL      = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let targaryenURL    = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrellURL       = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrell")!
            let reedURL         = URL(string: "https://awoiaf.westeros.org/index.php/House_Reed")!
            let gloverURL       = URL(string: "https://awoiaf.westeros.org/index.php/House_Glover")!
            let tullyURL         = URL(string: "https://awoiaf.westeros.org/index.php/House_Tully")!
            let tarlyURL         = URL(string: "https://awoiaf.westeros.org/index.php/House_Tarly")!
            
            
            // Sigils

            let mormontSigil = Sigil(image: #imageLiteral(resourceName: "mormontSigil.png"), description: "Rampant bear")
            let greyjoySigil = Sigil(image: #imageLiteral(resourceName: "greyjoySigil.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSigil.png"), description: "A red three-headed dragon")
            let tyrellSigil = Sigil(image: #imageLiteral(resourceName: "tyrellSigil.png") , description: "A golden rose on a green field")
            let reedSigil = Sigil(image: #imageLiteral(resourceName: "reedSigil.png"), description: "A black lizard-lion on grey-green")
            let gloverSigil = Sigil(image: #imageLiteral(resourceName: "gloverSigil.png"), description: "A silver fist on scarlet")
            let tullySigil = Sigil(image: #imageLiteral(resourceName: "tullySigil.png"), description: "A leaping silver trout on a field of blue and mud red")
            let tarlySigil = Sigil(image: #imageLiteral(resourceName: "tarlySigil.png"), description: "Vert, a huntsman striding to dexter proper garbed gules")
       
            let stark       = House(name: "Stark",
                                    sigil: starkSigil,
                                    words: "Winter is coming",
                                    url: starkURL)
            let lannister   = House(name: "Lannister",
                                    sigil: lannisterSigil,
                                    words: "Hear me roar!",
                                    url: lannisterURL)
            let greyjoy     = House(name: "Greyjoy",
                                    sigil: greyjoySigil,
                                    words: "We Do Not Sow",
                                    url: greyjoyURL)
            let targaryen   = House(name: "Targaryen",
                                    sigil: targaryenSigil,
                                    words: "Fire and Blood",
                                    url: targaryenURL)
            let tyrell      = House(name: "Tyrell",
                                    sigil: tyrellSigil,
                                    words: "Growing Strong",
                                    url: tyrellURL)
            
     
            let mormont     = House(name: "Mormont",
                                    sigil: mormontSigil,
                                    words: "Here we stand!",
                                    url: mormontURL)
            
            let reed        = House(name: "Reed",
                                    sigil: reedSigil,
                                    words: "Hearth, heart and harvest",
                                    url: reedURL)
           
            let glover      = House(name: "Glover",
                                    sigil: gloverSigil,
                                    words: "Sworn to stark",
                                    url: gloverURL)
        
            let tully       = House(name: "Tully",
                                    sigil: tullySigil,
                                    words: "Family, Duty, Honor",
                                    url: tullyURL)
  
            let tarly       = House(name: "Tarly",
                                    sigil: tarlySigil,
                                    words: "First in Battle",
                                    url: tarlyURL)

            let robb    = Person(name: "Robb", alias: "The young wolf", house: stark)
            let sansa   = Person(name: "Sansa", alias: "Little bird", house: stark)
            let arya    = Person(name: "Arya", house: stark)
            let brandon = Person(name: "Brandon", alias: "The winged wolf", house: stark)
            let rickon  = Person(name: "Rickon", house: stark)
            
            
            // ---- Lannister ----
            let tyrion  = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime   = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let cersei  = Person(name: "Cersei", house: lannister)
            let lancel  = Person(name: "Lancel", house: lannister)
            
       
            let lyanna  = Person(name: "Lyanna", house: mormont)
            
      
            let asha    = Person(name: "Asha", alias: "Esgred", house: greyjoy)
            let theon   = Person(name: "Theon", alias: "Reek", house: greyjoy)
            let euron   = Person(name: "Euron III", alias: "Crow's Eye", house: greyjoy)
            

            let daenerys    = Person(name: "Daenerys", alias: "Dragonmother", house: targaryen)
            let viserys     = Person(name: "Viserys", alias: "The Beggar King", house: targaryen)
            

            let mace        = Person(name: "Mace", alias: "Lord Oaf", house: tyrell)
            let loras       = Person(name: "Loras", alias: "The Knight of Flowers", house: tyrell)
            let margaery    = Person(name: "Margaery", alias: "Little rose", house: tyrell)
            let olenna      = Person(name: "Olenna", alias: "Queen of Thorns", house: tyrell)
            
            // Add characters in houses
            // ---- Stark ----
            stark.add(persons: robb, sansa, arya, brandon, rickon)
            
            // ---- Lannister ----
            lannister.add(persons: tyrion, jaime, cersei, lancel)
            
            // ---- Mormont ----
            mormont.add(persons: lyanna)
            
            // ---- Greyjoy ----
            greyjoy.add(persons: asha, theon, euron)
            
            // ---- Targaryen ----
            targaryen.add(persons: daenerys, viserys)
            
            // ---- Tyrell ----
            tyrell.add(persons: mace, loras, margaery, olenna)
            
            
            // Add vassals in houses
            // ---- Stark ----
            //stark.addMinorHouse(houses: mormont)
            //stark.addMinorHouse(houses: glover)
            //stark.addMinorHouse(houses: tully)
            //stark.addMinorHouse(houses: reed)
            
            // ---- Tyrell ----
            //tyrell.addMinorHouse(houses: tarly)
            
            return [stark, lannister, mormont, tyrell, greyjoy, targaryen, glover, tully, reed, tarly].sorted()
            
        }
    }
    
    // MARK: - Seasons Repository
    
    var seasons: [Season]{
        get{
            
            var arrayPersons = [Person]()
            let houses = self.houses
            
            for house in houses {
                for person in house.sortedMembers() {
                    arrayPersons.append(person)
                }
            }
            
            let season1      = Season(name: "Season 1",
                                      dateRelease: "2011-04-17",
                                      dateFinish: "2011-06-19",
                                      synopsis: "Season 1 spans a period of several months on a world where the seasons last for years at a time. The action begins in the unified Seven Kingdoms of Westeros as the long summer ends and winter draws near. Lord Eddard Stark is asked by his old friend, King Robert Baratheon, to serve as the Hand of the King following the death of the previous incumbent, Eddard's mentor Jon Arryn. Eddard is reluctant, but receives intelligence suggesting that Jon was murdered. Eddard accepts Robert's offer, planning to use his position and authority to investigate the alleged murder.")
            let season2      = Season(name: "Season 2",
                                      dateRelease: "2012-04-01",
                                      dateFinish: "2012-06-03",
                                      synopsis: "Season 2 spans several months on a world where the seasons last for years at a time. The Seven Kingdoms are at war, with the King in the North, Robb Stark, fighting to win independence for his people and those of the Riverlands. Robb decides that he must win the allegiance of the fiercely independent ironborn to his cause, and sends his best friend Theon Greyjoy to treat with his father, who is hatching plans of his own. Meanwhile, Joffrey Baratheon holds the Iron Throne with the backing of the powerful House Lannister, but his uncle Renly has also claimed the throne with the support of House Tyrell, whose armies are much larger. As they struggle for the throne, Tyrion Lannister arrives in King's Landing to take matters in hand, only to face opposition from his scheming sister, Cersei, now the Queen Regent.")
            let season3      = Season(name: "Season 3",
                                      dateRelease: "2013-03-31",
                                      dateFinish: "2013-06-09",
                                      synopsis: "Season 3 spans several months on a world where the seasons can last for years at a time. Autumn has fallen across the world, with winter not far behind. The people should be preparing for years of snow and ice, but the Seven Kingdoms of Westeros instead remain gripped by civil war. Would-be king Renly Baratheon has been assassinated, altering the alliances in the war. The cruel boy-king Joffrey Baratheon has won a great victory by securing an alliance with House Tyrell, with his supporters defeating his uncle Stannis in an epic battle. Joffrey now commands the largest armies in the realm and his triumph appears inevitable.")
            let season4      = Season(name: "Season 4",
                                      dateRelease: "2014-04-06",
                                      dateFinish: "2014-06-15",
                                      synopsis: "The War of the Five Kings is drawing to a close, but new intrigues and plots are in motion, and the surviving factions must contend with enemies not only outside their ranks, but within.")
            let season5      = Season(name: "Season 5",
                                      dateRelease: "2015-04-12",
                                      dateFinish: "2015-06-14",
                                      synopsis: "The War of the Five Kings, once thought to be drawing to a close, is instead entering a new and more chaotic phase. Westeros is on the brink of collapse, and many are seizing what they can while the realm implodes, like a corpse making a feast for crows.")
            let season6      = Season(name: "Season 6",
                                      dateRelease: "2016-04-24",
                                      dateFinish: "2016-06-26",
                                      synopsis: "Westeros braces for a winter which may become a new Long Night, as the White Walkers and their army of the dead are poised to strike against the Wall and the realms of men.")
            
            var arrayEpisodes = [Episode]()
            
            arrayEpisodes.append(Episode(name: "Episode 1",
                                         dateRelease: "2011-04-17",
                                         numberOvervall: 01,
                                         numberInSeason: 01,
                                         title: "Winter Is Coming",
                                         season: season1,
                                         synopsis: "In the Seven Kingdoms of Westeros, a soldier survives an attack by the supernatural creatures known as the White Walkers. He rushes to Castle Winterfell, which is ruled by Eddard, who decapitates him for deserting his post. In King's Landing, the capital, Jon Arryn, the \"Hand of the King\", dies under mysterious circumstances."))
            arrayEpisodes.append(Episode(name: "Episode 2",
                                         dateRelease: "2011-04-24",
                                         numberOvervall: 02,
                                         numberInSeason: 02,
                                         title: "The Kingsroad",
                                         season: season1,
                                         synopsis: "Having accepted his new role as the Hand of the King, Eddard leaves Winterfell with his daughters Sansa and Arya, while Catelyn stays behind to tend to Bran. The unconscious Bran is attacked by an assassin, but his direwolf saves him. Catelyn decides to go to King's Landing to tell Eddard about the attempt and suspected Lannister involvement."))
            arrayEpisodes.append(Episode(name: "Episode 3",
                                         dateRelease: "2011-05-01",
                                         numberOvervall: 03,
                                         numberInSeason: 03,
                                         title: "Lord Snow",
                                         season: season1,
                                         synopsis: "Ned joins the King's Small Council at King's Landing, capital of the Seven Kingdoms, and learns just how poorly Westeros is being managed. Catelyn tries to covertly warn her husband, but is intercepted by an old friend, Councillor Petyr \"Littlefinger\" Baelish."))
            arrayEpisodes.append(Episode(name: "Episode 4",
                                         dateRelease: "2011-05-08",
                                         numberOvervall: 04,
                                         numberInSeason: 04,
                                         title: "Cripples, Bastards, and Broken Things",
                                         season: season1,
                                         synopsis: "Tyrion shares saddle modifications for Bran that will allow the paraplegic boy to ride before heading south. Ned searches for clues to the unexplained death of his mentor and predecessor Jon Arryn and in the process uncovers King Robert's illegitimate son."))
            arrayEpisodes.append(Episode(name: "Episode 5",
                                         dateRelease: "2011-05-15",
                                         numberOvervall: 05,
                                         numberInSeason: 05,
                                         title: "The Wolf and the Lion",
                                         season: season1,
                                         synopsis: "Ned refuses to participate in Robert's plan to assassinate the pregnant Daenerys Targaryen, and resigns as Robert's Hand, angering him. Catelyn and Tyrion (who she has taken as her prisoner) arrive at her sister Lysa's home in the Eyrie."))
            arrayEpisodes.append(Episode(name: "Episode 6",
                                         dateRelease: "2011-05-22",
                                         numberOvervall: 06,
                                         numberInSeason: 06,
                                         title: "A Golden Crown",
                                         season: season1,
                                         synopsis: "Robert reappoints Eddard as Hand and tasks him with running affairs until he returns from hunting. Villagers from Riverrun arrive in the throne room with news of atrocities committed by raiders, who Eddard deduces were led by Gregor Clegane, a Lannister retainer."))
            arrayEpisodes.append(Episode(name: "Episode 7",
                                         dateRelease: "2011-05-22",
                                         numberOvervall: 07,
                                         numberInSeason: 07,
                                         title: "You Win or You Die",
                                         season: season1,
                                         synopsis: "In King's Landing, Eddard tells Cersei he knows she is involved with Jaime and none of her children are Robert's. They soon learn that Robert has been critically wounded by a boar while hunting. A dying Robert names Eddard as the \"Protector of the realm\" to rule until Joffrey reaches the legal age. "))
            arrayEpisodes.append(Episode(name: "Episode 8",
                                         dateRelease: "2011-06-05",
                                         numberOvervall: 08,
                                         numberInSeason: 08,
                                         title: "The Pointy End",
                                         season: season1,
                                         synopsis: "Arya manages to escape King's Landing after her Braavosian sword master delays the guards sent to arrest her; Sansa is captured however. Robb hears the news and prepares the Northern armies to fight the Lannisters, leaving Bran behind to rule Winterfell."))
            arrayEpisodes.append(Episode(name: "Episode 9",
                                         dateRelease: "2011-06-12",
                                         numberOvervall: 09,
                                         numberInSeason: 09,
                                         title: "Baelor",
                                         season: season1,
                                         synopsis: "Arya manages to escape King's Landing after her Braavosian sword master delays the guards sent to arrest her; Sansa is captured however. Robb hears the news and prepares the Northern armies to fight the Lannisters, leaving Bran behind to rule Winterfell."))
            arrayEpisodes.append(Episode(name: "Episode 10",
                                         dateRelease: "2011-06-19",
                                         numberOvervall: 10,
                                         numberInSeason: 10,
                                         title: "Fire and Blood",
                                         season: season1,
                                         synopsis: "The North secedes from the Seven Kingdoms and proclaims Robb as their king. With Jaime captured by the Starks and Robert's brothers challenging Joffrey's claim to the throne, Tywin appoints Tyrion as King's Hand. Jon plans to desert his post at the Wall to avenge Eddard, but his friends convince him to stay and he instead joins a Night's Watch expedition to find Benjen beyond the Wall. "))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season1.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(name: "Episode 1", dateRelease: "2012-04-01", numberOvervall: 11, numberInSeason: 01, title: "The North Remembers", season: season2, synopsis: "The North Remembers"))
            arrayEpisodes.append(Episode(name: "Episode 2", dateRelease: "2012-04-08", numberOvervall: 12, numberInSeason: 02, title: "The Night Lands", season: season2, synopsis: "The Night Lands"))
         
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season2.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(name: "Episode 1", dateRelease: "2013-03-31", numberOvervall: 21, numberInSeason: 01, title: "Valar Dohaeris", season: season3, synopsis: "Valar Dohaeris"))
            arrayEpisodes.append(Episode(name: "Episode 2", dateRelease: "2013-04-07", numberOvervall: 22, numberInSeason: 02, title: "Dark Wings, Dark Words", season: season3, synopsis: "Dark Wings, Dark Words"))
           
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season3.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(name: "Episode 1", dateRelease: "2014-04-06", numberOvervall: 31, numberInSeason: 01, title: "Two Swords", season: season4, synopsis: "Two Swords"))
            arrayEpisodes.append(Episode(name: "Episode 2", dateRelease: "2014-04-13", numberOvervall: 32, numberInSeason: 02, title: "The Lion and the Rose", season: season4, synopsis: "The Lion and the Rose"))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season4.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes = []
            
            arrayEpisodes.append(Episode(name: "Episode 1", dateRelease: "2015-04-12", numberOvervall: 41, numberInSeason: 01, title: "The Wars to Come", season: season5, synopsis: "The Wars to Come"))
            arrayEpisodes.append(Episode(name: "Episode 2", dateRelease: "2015-04-19", numberOvervall: 42, numberInSeason: 02, title: "The House of Black and White", season: season5, synopsis: "The House of Black and White"))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season5.add(episodesArray: arrayEpisodes)
            
            arrayEpisodes.append(Episode(name: "Episode 1", dateRelease: "2016-04-24", numberOvervall: 51, numberInSeason: 01, title: "The Red Woman", season: season6, synopsis: "The Red Woman"))
            arrayEpisodes.append(Episode(name: "Episode 2", dateRelease: "2016-05-01", numberOvervall: 52, numberInSeason: 02, title: "Home", season: season6, synopsis: "Home"))
            
            for episode in arrayEpisodes{
                episode.add(personArray: arrayPersons)
            }
            
            season6.add(episodesArray: arrayEpisodes)
            
           
            
            
            return [season2, season4, season6, season1, season3, season5].sorted()
            
        }
    }

    
    func house(named: String) -> House? {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
    
    func houses(filteredBy: Filter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }

    // MARK: - Funtions - Seasons
    func season(named: String) -> Season? {
        let season = seasons.filter{$0.name == named}.first
        return season
        
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }

}
