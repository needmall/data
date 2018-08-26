// 거리 계산 함수
// 사용법 : select calc_distance( [위도1],[경도1],[위도2],[경도2]) from dual;

CREATE OR REPLACE FUNCTION calc_distance(
  pLat1 NUMBER,
  pLon1 NUMBER,
  pLat2 NUMBER,
  pLon2 NUMBER)
  RETURN NUMBER
 IS

-- r은 지구의 구형 반지름 (km) 
 cSpherRad CONSTANT NUMBER := 6367*1000;                                 -- 곱하기 1000을 해서 현재 표시단위 km이 아닌 m
                                                                         -- 지구의 구형 반경은 마일로 3956
 a        NUMBER;
 vLat     NUMBER;
 vLat1Rad NUMBER;
 vLat2Rad NUMBER;
 vLon     NUMBER;
 vLon1Rad NUMBER;
 vLon2Rad NUMBER;

BEGIN
   /*
   대부분의 컴퓨터는 라디안으로 표시되기 위해서는 삼각함수의 인수들이 필요하다.
   lon1, lat1 및 lon2, lat2를 각도, 분, 초에서 라디안으로 변환하려면
   먼저 10진수로 변환하여야 한다.
   10진수를 구하려면 pi / 180 = 0.017453293 라디안 / 도씩 곱한다.
   */

   vLat1Rad := pLat1 * 0.017453293;
   vLat2Rad := pLat2 * 0.017453293;
   vLon1Rad := pLon1 * 0.017453293;
   vLon2Rad := pLon2 * 0.017453293;

   vLon := vLon2Rad - vLon1Rad;
   vLat := vLat2Rad - vLat1Rad;

   a := POWER(SIN(vLat/2),2) + COS(vLat1Rad) * COS(vLat2Rad) *
   POWER(SIN(vLon/2),2);

  /*
   중간 결과 c는 라디안 단위의 큰 원 거리입니다.
   역 삼각 함수는 라디안으로 표시된 결과를 반환합니다.
   십진수로 c를 표현하려면 라디안 수에 180 / pi = 57.295780 degrees / radian을 곱하십시오.
   큰 원형 거리 d는 r과 같은 단위로 나타납니다.
   */

   RETURN ROUND(cSpherRad * 2 * ATAN2(SQRT(a), SQRT(1-a)),1);
 EXCEPTION
   WHEN OTHERS THEN
     RETURN 999999;
 END calc_distance;
 /