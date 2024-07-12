// ------------------------------------------------------------------------------
// Löschen
// ------------------------------------------------------------------------------
match (n) detach delete n;

// ------------------------------------------------------------------------------
// Knoten
// ------------------------------------------------------------------------------
CREATE (hgt:Station {name: 'Harrogate'}), (lds:Station {name: 'Leeds'}),
(sbe:Station {name: 'Starbeck'}), (hbp:Station {name: 'Hornbeam Park'}),
(wet:Station {name: 'Weeton'}), (hrs:Station {name: 'Horsforth'}),
(hdy:Station {name: 'Headingley'}), (buy:Station {name: 'Burley Park'}),
(pnl:Station {name: 'Pannal'}), (hud:Station {name: 'Huddersfield'}),
(s9:Stop {arrives: time('11:53')}),
(s8:Stop {arrives: time('11:44'), departs: time('11:45')}),
(s7:Stop {arrives: time('11:40'), departs: time('11:43')}),
(s6:Stop {arrives: time('11:38'), departs: time('11:39')}),
(s5:Stop {arrives: time('11:29'), departs: time('11:30')}),
(s4:Stop {arrives: time('11:24'), departs: time('11:25')}),
(s3:Stop {arrives: time('11:19'), departs: time('11:20')}),
(s2:Stop {arrives: time('11:16'), departs: time('11:17')}),
(s1:Stop {departs: time('11:11')}), (s21:Stop {arrives: time('11:25')}),
(s211:Stop {departs: time('11:00')}), (s10:Stop {arrives: time('11:45')}),
(s101:Stop {departs: time('11:20')}), (s11:Stop {arrives: time('12:05')}),
(s111:Stop {departs: time('11:40')}), (s12:Stop {arrives: time('12:07')}),
(s121:Stop {departs: time('11:50')}), (s13:Stop {arrives: time('12:37')}),
(s131:Stop {departs: time('12:20')}),
(lds)<-[:CALLS_AT]-(s9), 
(buy)<-[:CALLS_AT]-(s8)-[:NEXT]->(s9),
(hdy)<-[:CALLS_AT]-(s7)-[:NEXT]->(s8), 
(hrs)<-[:CALLS_AT]-(s6)-[:NEXT]->(s7),
(wet)<-[:CALLS_AT]-(s5)-[:NEXT]->(s6), 
(pnl)<-[:CALLS_AT]-(s4)-[:NEXT]->(s5),
(hbp)<-[:CALLS_AT]-(s3)-[:NEXT]->(s4), 
(hgt)<-[:CALLS_AT]-(s2)-[:NEXT]->(s3),
(sbe)<-[:CALLS_AT]-(s1)-[:NEXT]->(s2), 
(lds)<-[:CALLS_AT]-(s21), 
(hgt)<-[:CALLS_AT]-(s211)-[:NEXT]->(s21), 
(lds)<-[:CALLS_AT]-(s10), 
(hgt)<-[:CALLS_AT]-(s101)-[:NEXT]->(s10), 
(lds)<-[:CALLS_AT]-(s11), 
(hgt)<-[:CALLS_AT]-(s111)-[:NEXT]->(s11), 
(hud)<-[:CALLS_AT]-(s12), 
(lds)<-[:CALLS_AT]-(s121)-[:NEXT]->(s12), 
(hud)<-[:CALLS_AT]-(s13), 
(lds)<-[:CALLS_AT]-(s131)-[:NEXT]->(s13)
