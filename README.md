Built with [![Godot](https://img.shields.io/badge/Godot-478CBF?logo=godot-engine&logoColor=white)](https://godotengine.org)

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F6%2F6a%2FGodot_icon.svg%2F1024px-Godot_icon.svg.png&f=1&nofb=1&ipt=30537ca22ebbf8368fcc6785f4cfcc08d7312be28dc9d651730b87b51ea47633" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Comical Novel Engine </h3>

  <p align="center">
    Custom data driven engine for Visual Novels written in GDScript using JSON.
  </p>
</div>

<div align="center">
  <p><b>Engine Preview</b></p>
  <img src="https://github.com/MatthewDysko/ComicalNovelEngine/blob/main/assets/VN2.gif?raw=true">
  <p><b>Menu Animations</b></p>
  <img src="https://github.com/MatthewDysko/ComicalNovelEngine/blob/main/assets/VN.gif?raw=true">
  <p><b>Edge Cases</b></p>
  <img src="https://github.com/MatthewDysko/ComicalNovelEngine/blob/main/assets/VN3.gif?raw=true">
</div>

<!-- ABOUT THE PROJECT -->
## About The Project
Here's something fun! 
While studying abroad in San Francisco I took part in a _Game Development Club_.
I helped people make their first projects in Godot, and to showcase it's capabilities I've written this tiny data driven project showcasing:

- Object Oriented Programing Concepts
- Reading/Writing/Handeling JSON files.
- Custom Animations
- Interesting UX/UI Elements.
- Dynamicly Moving/Changing and Emoting Characters!
- Custom Handling of Dialogue Trees.
- Ton of flexibility!

This took about a week, with the estetics being vaguly (or not so vaguly) inspired by the SMT Persona Series.
If I was ever to continue the next step would be to write a seperete software for editing/creating these specifc JSON files.

<!-- GETTING STARTED -->
## Getting Started

This is an example of how you'd use this engine to write simple Visual Novel style stories!.

#### JSON Examples:

*Scene Setup*:
```Json
{
    "about": "Tenyo's Sings a Song",
    "backdrop": "class.png",
    "actors": [
        {
            "actor": {
                "id" : "tenyo",
                "img" : "tenyo.png",
                "sub_img" : 0.0,
                "position" : 2.0,
                "dialogue" : "dial_test"
            }
        },
        {
            "actor": {
                "id" : "tenyo",
                "img" : "izumi.png",
                "sub_img" : 0.0,
                "position" : 4.0,
                "dialogue" : "dial_0032320"
            }
        }
    ]
}
```

*Dialogue Example*:
```Json
{
	"0": [{
			"dial": "Two boys stand in front of a school gate as they are about to go in, one of them stops the other and says:",
			"nametag": "???",
			"effect": "fade_in"
		},{
			"dial": "Okay... buddy...",
			"nametag": "Shinji",
			"effect": "fade_out",
			"sprites": [
				{
					"action": "create",
					"id": "shinji",
					"img": "shinji.png",
					"sub_img": 2.0,
					"position": 3.0
				}
			]
		},{
			"dial": "Do you remember what I said?",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 1.0
				}
			]
		},{
			"choices": [
				{
					"option": "No.",
					"result": "1"
				},
				{
					"option": "Yes (lie)",
					"result": "2"
				}
			]
		}
	],
	"1": [{
			"dial": "You said something said?",
			"nametag": "katsuo",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 3.0
				}
			]
		},{
			"dial": "Where you even listening?",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 3.0
				}
			]
			
		},{
			"go_to": "3"
		}
	],
	"2": [{
			"dial": "Uhh...?",
			"nametag": "katsuo"
		},{
			"dial": "Switching guns is faster then reloading??",
			"nametag": "katsuo",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 3.0
				}
			]
		},{
			"dial": "No. I mean, yeah. duh.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 1.0
				}
			]
		},{
			"dial": "Not what I meant.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 2.0
				}
			]
		},{
			"go_to": "3"
		}
	],
	"3":[{
			"dial": "Izumi called me again. Me.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 0.0
				}
			]
		},
		{
			"dial": "She's gonna meet ya at the game club after school for that thing you have.",
			"nametag": "Shinji"
		},
		{
			"dial": "But maaan...",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 2.0
				}
			]
		}
		,
		{
			"dial": "When are you gonna get yourself a cellphone?",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 0.0
				}
			]
		},{
			"choices": [
				{
					"option": "I already have one.",
					"result": "4"
				},
				{
					"option": "Why? I have you.",
					"result": "5"
				},
				{
					"option": "...",
					"result": "6"
				}
			]
		}
	],
	"4": [{
			"dial": "That fuckin' cup on a string you made with Tenyo is not a cellphone.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 3.0
				}
			]
		},{
			"dial": "Not by a long stretch.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 2.0
				}
			]
		},{
			"dial": "...",
			"nametag": "katsuo"
		},{
			"dial": "String does - in fact - stretch pretty long.",
			"nametag": "katsuo",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 3.0
				}
			]
		},{
			"dial": "...",
			"nametag": "Shinji"
		},{
			"dial": "What were we talking about?",
			"nametag": "Shinji"
		},{
			"go_to": "6"
		}
	],
	"5": [{
			"dial": "Auch? I'm not some secretary that makes your schedule for you.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 3.0
				}
			]
		},{
			"dial": "What about my 10 o'clock with the company shareholders? Is it still happening?.",
			"nametag": "katsuo"
		},{
			"dial": " No. It was moved. Guys at wall street are all busy due to some irregularities with the stock market.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 2.0
				}
			]
		},{
			"dial": "...",
			"nametag": "Shinji"
		},{
			"dial": "...",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 3.0
				}
			]
		},{
			"dial": "I WILL NOT BE OBJECTIFIED!!!",
			"nametag": "Shinji"
		},{
			"dial": "...",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 2.0
				}
			]
		},{
			"go_to": "6"
		}
	],
	"6":[{
			"dial": "You've been working a lot lately 'suo.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 2.0
				}
			]
		},{
			"dial": "You must have some savings.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 1.0
				}
			]
		},{
			"dial": "Unless - you lost it? Already?.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 3.0
				}
			]
		},{
			"dial": "Oh man...",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 2.0
				}
			]
		},{
			"dial": "Tell me at least you lost it honorably...",
			"nametag": "Shinji"
		},{
			"dial": "Like at a Casino.",
			"nametag": "Shinji"
		},{
			"dial": "Or a rocks to throw at Tenyo.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 1.0
				}
			]
		},{
			"dial": "Both highly respectable.",
			"nametag": "Shinji",
			"sprites": [
				{
					"action": "modify",
					"id": "shinji",
					"sub_img": 0.0
				}
			]
		},{
			"dial": "As the bell rings, the new security guard rushes Shinji and Katsuo to get inside the school, before he closes the gate..",
			"nametag": "Narrator",
			"effect": "fade_in"
		}
	] 
}	
```


