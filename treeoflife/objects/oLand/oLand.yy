{
  "spriteId": {
    "name": "sLandIdle",
    "path": "sprites/sLandIdle/sLandIdle.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": {
    "name": "sEnemy",
    "path": "sprites/sEnemy/sEnemy.yy",
  },
  "persistent": false,
  "parentObjectId": {
    "name": "pEnemy",
    "path": "objects/pEnemy/pEnemy.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":4,"collisionObjectId":{"name":"pDefender","path":"objects/pDefender/pDefender.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"hp_max","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"35","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"damage","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"2","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"movement_speed","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"0.3","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Land",
    "path": "folders/Pollution/Land.yy",
  },
  "resourceVersion": "1.0",
  "name": "oLand",
  "tags": [],
  "resourceType": "GMObject",
}