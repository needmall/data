// �Ÿ� ��� �Լ�
// ���� : select calc_distance( [����1],[�浵1],[����2],[�浵2]) from dual;

CREATE OR REPLACE FUNCTION calc_distance(
  pLat1 NUMBER,
  pLon1 NUMBER,
  pLat2 NUMBER,
  pLon2 NUMBER)
  RETURN NUMBER
 IS

-- r�� ������ ���� ������ (km) 
 cSpherRad CONSTANT NUMBER := 6367*1000;                                 -- ���ϱ� 1000�� �ؼ� ���� ǥ�ô��� km�� �ƴ� m
                                                                         -- ������ ���� �ݰ��� ���Ϸ� 3956
 a        NUMBER;
 vLat     NUMBER;
 vLat1Rad NUMBER;
 vLat2Rad NUMBER;
 vLon     NUMBER;
 vLon1Rad NUMBER;
 vLon2Rad NUMBER;

BEGIN
   /*
   ��κ��� ��ǻ�ʹ� �������� ǥ�õǱ� ���ؼ��� �ﰢ�Լ��� �μ����� �ʿ��ϴ�.
   lon1, lat1 �� lon2, lat2�� ����, ��, �ʿ��� �������� ��ȯ�Ϸ���
   ���� 10������ ��ȯ�Ͽ��� �Ѵ�.
   10������ ���Ϸ��� pi / 180 = 0.017453293 ���� / ���� ���Ѵ�.
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
   �߰� ��� c�� ���� ������ ū �� �Ÿ��Դϴ�.
   �� �ﰢ �Լ��� �������� ǥ�õ� ����� ��ȯ�մϴ�.
   �������� c�� ǥ���Ϸ��� ���� ���� 180 / pi = 57.295780 degrees / radian�� ���Ͻʽÿ�.
   ū ���� �Ÿ� d�� r�� ���� ������ ��Ÿ���ϴ�.
   */

   RETURN ROUND(cSpherRad * 2 * ATAN2(SQRT(a), SQRT(1-a)),1);
 EXCEPTION
   WHEN OTHERS THEN
     RETURN 999999;
 END calc_distance;
 /