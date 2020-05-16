'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "33ee4f980633aab63b31a67317792ea4",
"/": "33ee4f980633aab63b31a67317792ea4",
"main.dart.js": "de13dd44a4dcc652acd22a9c4e0f3944",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "c5263d78dac2d0a54024c2f3c3b6e72d",
"assets/LICENSE": "833c5e606da42a83bd659704a470a9c2",
"assets/AssetManifest.json": "7cf80a83089816e98ad5c53526f70fd8",
"assets/FontManifest.json": "4ce3702c20680be2b63c73b3c65a9147",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/images/maps/Chapter1/Greenest/T1.png": "06c5e2e4dcfb9cadf3238d450dad52d7",
"assets/assets/images/joystick_attack_range.png": "8994f23fc67442c8361432f0cc9a2fa1",
"assets/assets/images/joystick_background.png": "8c9aa78348b48e03f06bb97f74b819c9",
"assets/assets/images/health_ui.png": "219e39516312f2f6bc264357497b99cb",
"assets/assets/images/tile/floor_2.png": "10968e74b671f14aab19e13a76da334d",
"assets/assets/images/tile/floor_3.png": "3fa52d5af2a38dede0142f5c3dcaab55",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_dark1.png": "dbdbbc530b47eb4778e1c6fb9f589785",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/pebble_red0.png": "a96d334a8bf852150b5afdb4af2c66f0",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall2.png": "421507d59bddb242d446228a0e97abf8",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_dark3.png": "602256a74e71f28b71d90a4ce323589a",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown1.png": "303e0bb317dd24a757a2fafc766229bd",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown0.png": "dba9cde540bc26f5b26888959874b9da",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_dark2.png": "318a0a5f80895737cbfe584e27d56341",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/shadow_nw.png": "77a38143d836149fbf101cf4d187cd65",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall3.png": "bafb91504c73d2115cc894c4d1ea9921",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/pebble_red1.png": "5bb739a2724e3b764b01a34c0dea6bae",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_dark0.png": "20c2d32c168d6984d4787e9186deb6c1",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_dark2.png": "cd5249ecf107d22002f6f6bd19cef445",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/pebble_red3.png": "accda2971e477bff68125d458616b872",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall1.png": "9e0b5f986f72d579a9856f20eeebed51",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_dark0.png": "f8a3c80f7cb43280d63f1f4e35bd04f0",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown2.png": "58322f27ccea5db642185b5c823f62cf",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown3.png": "8169c5a032ff1615c1ed75cfcdd2dab6",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_dark1.png": "e517f901bcc788da21bd86860a77c814",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall0.png": "51d6df77cd4cb2320a3bfe49624c3e0c",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/pebble_red2.png": "4675f0cca5f528a2f559d46444ede8b5",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_dark3.png": "08d17125e734ddf58ac72a697f7a8356",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_gray1.png": "deef50c3a3cec0f4a78de03baa7e0aaa",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_brown3.png": "9d49a677f04159016dc65bf3013db84e",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/vault1.png": "d6589de52f2c697e7ff0c7a4246c64cb",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/zot_blue1.png": "210952ea1e62a0e764d0ddd725f6479d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/dngn_mirrored_wall.png": "0796cb53682f1937e36614c1b306ea53",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall4.png": "fbe78eda6ae12170a56c6657ebec21ad",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown7.png": "f44eec61700e827bc432a3f2728e9880",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_gray3.png": "5054ea5f8be0a95cf958efc1363c0833",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_gray2.png": "312a2f7a6d4c5e31aa370b726f17eaaa",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown6.png": "b681a91abd4bbbcb35cc77aef1a230c3",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall5.png": "2c48f7b633db4272dcdde81a8170776a",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked8.png": "9f3307f24164a9c115626f423cf79989",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/zot_blue0.png": "e93606317955808fa629a35ea9926011",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/vault0.png": "89bc92eac6c987f1c8e96a42ef1a4586",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_brown2.png": "ff95a9bd7366573a42ce771b0c4fadd1",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_gray0.png": "78dea7c37674744253ab178d29396574",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_brown0.png": "3a03ed04f58973d1197530847e85baa1",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_gray2.png": "ef269836de6353752ada0ae16b61c688",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/vault2.png": "b4e9834a657972980725ff183938a356",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/zot_blue2.png": "d9ae030482ecf04ff6642cf06012e2d4",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall7.png": "de0ab11a615aaf9acc9213071fbf2459",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown4.png": "640714682d7f71999af7d0f64ae18821",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives8.png": "96febfff9ee3467e83763da0a626b1b6",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_gray0.png": "542378edd49dc8e0b9c5b7f6927cc9a4",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tree2_lightred.png": "96223cc332c62a644d6d54be73aa44fb",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_gray1.png": "4b6c8907ea03f3ada01554f758015d5d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives9.png": "a2f8100078209bec9146a88fe1ee6679",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown5.png": "16898de14ff2a3c0ad39a560b7ef966e",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tree1_yellow.png": "860d0d21be82cbce868c53e06c94b879",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/shadow_ne.png": "e0e89a2de1b0d007f680f39ec6f6c552",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall6.png": "734bc290cdcb49a10fd514acc6a6812c",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/zot_blue3.png": "317820da0bb581a2e4d8b6c4f4da9955",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/vault3.png": "c77c26e608ca1a6e8bc820c52822c633",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_gray3.png": "0ef55da7bd02f5079ec8eb5287669fbc",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone2_brown1.png": "307ad9514dd096305c8a2681c16c65ae",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_vines3.png": "ee6d2392dfe488b864b7f061a0c6e774",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown-vines4.png": "92537f8fa343a16f1baec20237be38c9",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick1.png": "61d49210f67d3a6eeb4c3ecbef5bb4a2",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall1.png": "c0b51248137e2c490901d867ed0ce042",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/undead2.png": "f12859e5cf554086f3d8b0b58fe5e21b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/undead3.png": "a25edcf9711837368900f7ec4e892f5b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_vines2.png": "305636aedbe2c9d370673fa427532daf",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_vines0.png": "28d3d87d7deae6e490f57b794d5eac16",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown-vines1_right.png": "0987ea93196e7600cfd135d2a7decb1c",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick2.png": "fd6fbb9be586531c75bc73e248231ab8",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/dngn_metal_wall.png": "49105b2e5b6a5584be1aa11778eabfd0",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall2.png": "9ad4cc5ab4d2ae746f1f3081b8688855",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/undead1.png": "0ebbdc717a81c8a1c9e9e1977354ccec",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/undead0.png": "f53598516f658ae2d84fb020b1ff9aee",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall3.png": "d9209820e1faed7c22d07dba6306a62e",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick3.png": "c4838b81091d7502534a7a583b3ea061",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/shadow_w.png": "9de3181a554fca77368a5922f477f923",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_vines1.png": "748f4ecb2a15fec58f36a94479283acf",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_vines5.png": "acffd8df1c31987459126f4e168877f7",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown-vines2.png": "f9d132262b18a6175040835228ad55ef",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/dngn_metal_wall_cracked.png": "c730e72e1ee9c6d17e7c79efb2ccd122",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall09.png": "cdbb94e8a53cc2b53df7ad435af66b03",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick7.png": "6d8d06b67b5f116d5608ba53acae34f3",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall7.png": "175aa7d7ea4bcf339d3427bbb6c0907a",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall6.png": "d218cd1062aa04e5d43d1cf3d58041b6",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick6.png": "c7b01ffd3a59e35603156f795d6d1f31",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/dngn_transparent_wall.png": "be090a99c7545dcf9ba070244c67670d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall08.png": "83256d16333a01673da4d8ff3069b2ba",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/shadow_e.png": "fc4ab5187dee667bee3395ececa9016a",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown-vines3.png": "f985b8c73db6e877b4120a249fe18e6d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_vines4.png": "98120eadb60c8deaab6fafcc35ba9e5d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_vines6.png": "d5fc5aa21c502f3b9c5e3a24d6ee1012",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown-vines1.png": "c41844be6a738d879233ce847505d871",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick4.png": "6a9e4f47223e3c5eaa6fa5ef039d5eb5",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall4.png": "64f8b7bd79f299e2e4b1f658e0ee1ecd",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall5.png": "87625a10ec8fe4ed35e94a062eb11625",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick5.png": "b5cc68d93074ad7078ec8001514a3c12",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_brown-vines1_left.png": "2511d219378965215356bd4030e31ca1",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_gray1.png": "5b69df0f191d9064d59082f005accabc",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall06.png": "4192814ae305892fd76f321def9b278d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall12.png": "656146839e1f2d3ced5b83adfae39914",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_dark5.png": "1124a1b86f4e332203103c3fd5f378b7",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick8.png": "950566db99e8e36906fe8b41ad6eb547",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/hive1.png": "45cf111617cad6ab5ac6cf2daf15b04d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall8.png": "a3288de36774828edd67859e29b9f30d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/slime0.png": "f37419b3b0143dad3fd14dd8f90ab177",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/slime1.png": "fc83b63614a67416cbf3bb45fd35e9a1",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall9.png": "bf289da818a51bd74b0576e035c67e71",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/hive0.png": "7787897f79e9b9c18c0569c450530b64",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick9.png": "84bee12480d9f42b021592eac1d2a288",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_dark4.png": "76a3144c5700222c157646a7d549b598",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall13.png": "8083009b033d0108bd3595302b81cb87",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall07.png": "8ce951227c9abe43cff05ae102a7b633",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_gray0.png": "8a1db1fe96c4c9c5453831c91a4b500f",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_gray2.png": "4ffee2b2948af3b7b2d1a0e280d49334",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall11.png": "4a289cfa97f29159de0b3182c54c6f06",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall05.png": "37178a380a413b4629cfa2c3fd1feaa0",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_dark6.png": "493b5830846ff653829f557210e64f96",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/hive2.png": "87580d070721d6baa9893b0aaa53acf4",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/slime3.png": "a1d21bb4846b22936e063439277de8aa",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/slime2.png": "76e0c2e48e39a1cebdb6da64116de301",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/hive3.png": "df03a2628eb5d309f11324eb30c6553b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall04.png": "112fa8dc9f22c46da0eebe9faf4c2fe7",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall10.png": "950e80d6671307917eac887e7a9a1470",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_gray3.png": "26a71a4954556a3ea76b1a88dd6f2b8b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tomb1.png": "711c5ac4741616fbc5782427c9ae55c9",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall00.png": "5665fb6f3233525ccd206dc0043bd872",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_dark3.png": "84b1840723438b62840e4339319f1c28",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_yellow_rock1.png": "6d5d68ef756d8c649a80168bcceac1a4",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tree1_red.png": "2679bcec408553e341dec6784fb9d17b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_yellow_rock0.png": "90402b271584d4603b45be1ecb800b8b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall12.png": "6927b0ba1eb50b0cdb6b8d79f5dfef70",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_dark2.png": "393dd745b64e9ce7464e90a3b66cbec5",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall01.png": "36522d1f415ceefeed9ac670d7d30515",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tomb0.png": "c8cbbedd21148807217a831bef3afa46",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tomb2.png": "bf59f9c81fe8a843530c7e5049cccf7e",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/shadow_n.png": "18ddb59c8c0964d8f4ab91354d19081a",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall03.png": "6dec75a8f23579a05aec1f4da477daf6",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall10.png": "52b43436123a1a4704866b2edd3265eb",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_dark0.png": "6d178a9a5a88d15189cdec6549f2ec03",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_yellow_rock2.png": "bc2ff087db35e5b98ddbcd18c7861abc",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/dngn_wax_wall.png": "5a982324c201d1a307a73a3949c618b1",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_yellow_rock3.png": "a71ccb73914f099499cf5e0ae73d297b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/brick_dark1.png": "ec16a372a7a1ee43357228502b6b53e8",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/marble_wall11.png": "cb2c5ec26fcc558b1011ed1bf91dbf24",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/crystal_wall02.png": "ca228bee5ed4f0eedb438b883451168e",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tomb3.png": "6218c0159b0a77dd7562255c532e5bc6",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick11.png": "2b6120ce53ce7fc2be96df0e3783c1ec",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/volcanic_wall2.png": "19d6c43621528edb61909eafc0b0df06",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked6.png": "624315a123be73e3d893af32810dc541",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/lair3.png": "4b417ae6845017cbd5b5729c236332c3",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives4.png": "16f86eee9d1f143a8a7fe94b691fe002",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/dngn_green_crystal_wall.png": "d93ad4915a55986ebb4a2ca68c4e25cb",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_flesh6.png": "b08306fbd3b8bf1f2674801e24e01e35",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives5.png": "399cccb1fccb833d091d3dd5d0b303f0",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/lair2.png": "8e8892ac7f97d951840db263d99ddb65",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked7.png": "ee1519ce50d6032b52cb9e071040d970",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/volcanic_wall3.png": "72433bea3edb110a8bd7d2a15714dd7a",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick10.png": "8ea8f1b24e686aca381c2611ddd2469c",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_brick12.png": "07119f7b2a546df3f10788c7739af0f3",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/volcanic_wall1.png": "77080f737a1fdaeed6aa7dc4f4512a28",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked5.png": "d4951247c1ac393e3a78d462aa795c87",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall8.png": "9e08ffdfca82c9e9954a94ee4497ef77",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/lair0.png": "74ddadbd41ed4fba6da9187caa282e85",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives7.png": "0b2efd751aff70fd83ae3ce588ff3bc0",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tree2_yellow.png": "c361ab6e33c75768592a399bbf73df00",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_flesh4.png": "d14b3032a4fb557198802a87c9a13812",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_flesh5.png": "4c4f5d709a65846eb671fdfabcdd0452",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives6.png": "ae38372c475729b332351851369dadd7",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/lair1.png": "94d7ab97cb493511f42cbac175a9e47f",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/sandstone_wall9.png": "cd2ebccccb03a21e7dc89a535f446d54",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked4.png": "13d3f8a7bd3300c62b2abb64f817ffb4",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/volcanic_wall0.png": "f1261521214138ab36046f41080fcf4c",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked0.png": "56fbb8aa5e56bffd564559ffec4aff66",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/volcanic_wall4.png": "5d961f43d290cf655b21da37dbf5d7c1",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives2.png": "aff8601b7acb974cfea0e209489943a4",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/relief3.png": "a5a203e222013008476bbb114fd6689f",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_flesh1.png": "53c64c20d5eab96afd5fb5a6c2ffc295",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_flesh0.png": "9ee996740d08c46569d1d5ae69a4fc63",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/relief2.png": "e87beb5d77afc59c94225f95fd9b042e",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives3.png": "7fea2df0b8afe8813f6e38f1d7bde770",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/volcanic_wall5.png": "4f5243d2f220669a4e5582ac2c0a796b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked1.png": "89b7cb0ed0bd7081a75ba15495e4a662",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tree2_red.png": "9b6756a92403a59dffff31417ea4ed80",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked3.png": "00a8ae606864a04fed1315ac768d4f03",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/tree1_lightred.png": "d5df1f74518e9ba927b4405334b6abd9",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives1.png": "098f898006e3fb5cd6d8b3008093b636",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/relief0.png": "3538c5d8daf9d404241392aa19ccb89b",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_flesh2.png": "341a43264adda471fa8bbd1164886290",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/dngn_metal_wall_brown.png": "7576fbbf4ec83a1c012cdfa324ec57b1",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/wall_flesh3.png": "46f2b5b3b797a5efbfbf01c5e32a8189",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/relief1.png": "e5a885f5dd53fd81f264660a960c790d",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/beehives0.png": "995719646e232038b952c64fdac50bcd",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/volcanic_wall6.png": "00ea8ff11754a07b12880dfa30a5d1d8",
"assets/assets/images/tile/crawl_pack/dc-dngn/wall/stone_black_marked2.png": "7d35abd7ec5d6e8b4996e44c5f43ee7a",
"assets/assets/images/tile/crawl_pack/README.txt": "1c5df8fbfa6d99ef39e8ed06c3cc2e3a",
"assets/assets/images/tile/crawl_pack/LICENSE.txt": "296648c7dde34f04c9707c7f49a58386",
"assets/assets/images/tile/crawl_pack/utility/README.txt": "ce7b47e8119edea0038f6b5a19254b44",
"assets/assets/images/tile/floor_1.png": "00c3bd0c3d76a954f3f0a648cb13c3b3",
"assets/assets/images/tile/wall_top.png": "845ed35ef1482e21857c8bd70061c810",
"assets/assets/images/tile/wall_left_and_top.png": "5e7c81163a737dad7ed4a626d76a0b73",
"assets/assets/images/tile/floor_4.png": "2685b25c2471a762ff6f900b496c9e29",
"assets/assets/images/tile/floor_5.png": "6d63b1d77dcc35d4f7beb91125851e29",
"assets/assets/images/tile/floor_7.png": "7ba4503a62a1b242f05b5244e7b0dae4",
"assets/assets/images/tile/floor_6.png": "d464c18724611d109498d4c4e57316c4",
"assets/assets/images/tile/wall_left_and_bottom.png": "6583c02205abb0c84aef143379eb9bed",
"assets/assets/images/tile/wall_bottom.png": "31d2b04aca916c16bd31574d7134a853",
"assets/assets/images/tile/floor_10.png": "baf86a2272c83bd904bc25b4af03aa29",
"assets/assets/images/tile/wall_turn_left_top.png": "c9d8c9116dd5570fb87b6e1328cb0ee3",
"assets/assets/images/tile/wall_right.png": "aca869be30facbfd420754e870a78f58",
"assets/assets/images/tile/wall_right_and_bottom.png": "533d830adf7d86b810481118ed7aa2f9",
"assets/assets/images/tile/wall.png": "7a6ce85ad0ebd6694dd57e9fdca7535b",
"assets/assets/images/tile/wall_bottom_left.png": "7e83621a422ddd0e7b4425abe8ac3ec8",
"assets/assets/images/tile/wall_top_inner_right.png": "b26bd1cad50d0201d41ab18200976cfc",
"assets/assets/images/tile/wall_top_inner_left.png": "484e3c33e8559ff61f560e5f32791c5a",
"assets/assets/images/tile/wall_left.png": "b4ee6ba9d296a18fa532119ef8cb6157",
"assets/assets/images/tile/floor_8.png": "28692ad0c494efc5bc0f9669579006fe",
"assets/assets/images/tile/floor_9.png": "2b4e26d91d8f632bf4eaa5400cb7d748",
"assets/assets/images/tile/wall_bottom_right.png": "dd6772364441f0f2ea76c532fb4031dc",
"assets/assets/images/PathAndObjects.png": "4f081f8db4ce99a4a376762bee7af3e9",
"assets/assets/images/enemy/goblin_run_right.png": "565c2f9a0bb01a9c56975664f8cd375c",
"assets/assets/images/enemy/atack_effect_top.png": "df3eeb246450bf06de6dfc325d0bdbd0",
"assets/assets/images/enemy/atack_effect_left.png": "9c99ad913fcc75ce253f8db53faa846f",
"assets/assets/images/enemy/goblin_run_left.png": "05863189b562610b17a062114c7849a9",
"assets/assets/images/enemy/atack_effect_bottom.png": "aaeb1a8e791a0f15ba911e1d2540ab32",
"assets/assets/images/enemy/atack_effect_right.png": "15831f9ccee22a845e854ccb3d18f6e5",
"assets/assets/images/enemy/goblin_idle.png": "8c97e935786b994c3cff4008212381b9",
"assets/assets/images/enemy/goblin_idle_left.png": "a7563675f85ed259b2d0aae50ded196b",
"assets/assets/images/joystick_attack.png": "0f5325cb2ddcba703e4c9d7d2dd266df",
"assets/assets/images/blue_button2.png": "b2ac54312d3b566d324f461aa50b8f5b",
"assets/assets/images/items/potion_life.png": "825b71a3532854e849d512683dba06b0",
"assets/assets/images/items/flag_red.png": "6aca7b9e01f86f1b1a45e262e65821b8",
"assets/assets/images/items/torch_spritesheet.png": "858f57abd642f0303de50d719532f198",
"assets/assets/images/items/chest_spritesheet.png": "bcc8785d27d816e23eca114dd4e708ed",
"assets/assets/images/items/prisoner.png": "45dcdd9a419bcd1f39cfd78024865578",
"assets/assets/images/items/table.png": "5e22fb237c60943f46ba18d5e176c10c",
"assets/assets/images/items/barrel.png": "dc4d5a9e456b6f1c6ec6fdcc66af7727",
"assets/assets/images/items/bookshelf.png": "ce2fc17cb8251da9966a3e91bb0b2272",
"assets/assets/images/items/flag_green.png": "1a5a7df4b10a84b0a722b3b6600198dd",
"assets/assets/images/smoke_explosion.png": "555a8a42b72e662af232dc2092103c2a",
"assets/assets/images/characters/evlana/evlana_sprites_v1.png": "b9fe6d9bbbda2eca304aa8f0aed6d3d4",
"assets/assets/images/characters/evlana/attack_effect_top.png": "7b01845d595c3803a07567ee87710658",
"assets/assets/images/characters/evlana/attack_effect_right.png": "39b3d8583205c90284cd60f0e018f29d",
"assets/assets/images/characters/evlana/attack_effect_left.png": "5b5475da758d76f79c34429f70f7f6af",
"assets/assets/images/characters/evlana/attack_effect_bottom.png": "e2406062be291971a034123fdd1757f9",
"assets/assets/images/characters/evlana/evlana_v1.png": "ebe9732478a5107972eaae8c09b258c9",
"assets/assets/images/characters/crypt.png": "8e55febc1e2563a9d7ba4b48625ba88d",
"assets/assets/images/characters/npc/emote_exclamation.png": "8b1897ae92f3a077e0aadaef2626d65a",
"assets/assets/images/characters/npc/generic.png": "793843e3c1c369a7965837908d7751d8",
"assets/assets/images/blue_button1.png": "c5ac9ffc08055cdbb731e6bfb0d2593a",
"assets/assets/images/joystick_knob.png": "bb0811554c35e7d74df6d80fb5ff5cd5",
"assets/assets/images/player/fireball_top.png": "e9a76f3ea950d6bc22f8f4cd3a22d7e3",
"assets/assets/images/player/explosion_fire.png": "81a3691935a18a30572870b759ad1683",
"assets/assets/images/player/atack_effect_top.png": "7b01845d595c3803a07567ee87710658",
"assets/assets/images/player/atack_effect_left.png": "5b5475da758d76f79c34429f70f7f6af",
"assets/assets/images/player/emote_exclamation.png": "8b1897ae92f3a077e0aadaef2626d65a",
"assets/assets/images/player/atack_effect_bottom.png": "e2406062be291971a034123fdd1757f9",
"assets/assets/images/player/fireball_right.png": "aaa2c18fe241c16e95be131619693b80",
"assets/assets/images/player/fireball_left.png": "cb3370c9039ec112af7bee6edf3e342d",
"assets/assets/images/player/atack_effect_right.png": "39b3d8583205c90284cd60f0e018f29d",
"assets/assets/images/player/crypt.png": "8e55febc1e2563a9d7ba4b48625ba88d",
"assets/assets/images/player/fireball_bottom.png": "05522f950d8d60e15615ee9705ff2ef0"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
