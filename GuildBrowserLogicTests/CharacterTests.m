//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by Cornelius Coachman on 8/15/14.
//  Copyright (c) 2014 Charlie Fulton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Character.h"
#import "Item.h"

@interface CharacterTests : XCTestCase

@property (nonatomic, strong) NSDictionary *characterDetailJson;
@property (nonatomic, strong) Character *_testGuy;
@end

@implementation CharacterTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.characterDetailJson = [NSDictionary new];
    
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class] URLForResource:@"character" withExtension:@"json"];
    
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData options:kNilOptions error:&error];
    
    XCTAssertNotNil(json, @"invalid test data");
    
    self.characterDetailJson = json;
    
    NSLog(@"%@", self.characterDetailJson);
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
//    _characterDetailJson = nil;
}

- (void)testCreateCharacterFromDetailJson
{
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:self.characterDetailJson];
    XCTAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    XCTAssertNotNil(testGuy2, @"Could not create character from nil data");
}

-(void)testCreateCharacterFromDetailJsonProps
{
    self._testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    
    XCTAssertEqualObjects(self._testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    XCTAssertEqualObjects(self._testGuy.name, @"Hagrel", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    XCTAssertEqualObjects(self._testGuy.realm, @"Borean Tundra", @"realm is wrong");
    XCTAssertEqualObjects(self._testGuy.achievementPoints, @3130, @"achievement points is wrong");
    XCTAssertEqualObjects(self._testGuy.level,@85, @"level is wrong");
    
    XCTAssertEqualObjects(self._testGuy.classType, @"Warrior", @"class type is wrong");
    XCTAssertEqualObjects(self._testGuy.race, @"Human", @"race is wrong");
    XCTAssertEqualObjects(self._testGuy.gender, @"Male", @"gener is wrong");
    XCTAssertEqualObjects(self._testGuy.averageItemLevel, @379, @"avg item level is wrong");
    XCTAssertEqualObjects(self._testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}

// 2
-(void)testCreateCharacterFromDetailJsonValidateItems
{
    XCTAssertEqualObjects(self._testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    XCTAssertEqualObjects(self._testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    XCTAssertEqualObjects(self._testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    XCTAssertEqualObjects(self._testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    XCTAssertEqualObjects(self._testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    XCTAssertEqualObjects(self._testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    XCTAssertEqualObjects(self._testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    XCTAssertEqualObjects(self._testGuy.offHandItem.name,nil, @"offhand should be nil");
    XCTAssertEqualObjects(self._testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    XCTAssertEqualObjects(self._testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    XCTAssertEqualObjects(self._testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}

- (void)testExample
{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
