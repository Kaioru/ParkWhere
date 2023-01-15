/*
{
  "CarParkID": "CC7",
  "Area": "",
  "Development": "BLK 29/37 CHAI CHEE AVENUE",
  "Location": "1.325246206 103.9256873",
  "AvailableLots": 91,
  "LotType": "C",
  "Agency": "HDB"
},
*/

class CarparkDetail {
  final String id;
  final String name;

  final int lotAvailable;
  final String lotType;

  final String agency;

  CarparkDetail(
      this.id, this.name, this.lotAvailable, this.lotType, this.agency);
}
