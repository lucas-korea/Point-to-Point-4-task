![image](https://user-images.githubusercontent.com/57425658/102692582-9be50e80-4257-11eb-8f09-44c48a95353d.png)

![image](https://user-images.githubusercontent.com/57425658/102692584-9e476880-4257-11eb-8981-ec2a82efbc17.png)

![image](https://user-images.githubusercontent.com/57425658/102692585-a1425900-4257-11eb-90ca-f79eb338c9a3.png)

![image](https://user-images.githubusercontent.com/57425658/102692590-a6070d00-4257-11eb-9255-de25c5458915.png)

![image](https://user-images.githubusercontent.com/57425658/102692601-b919dd00-4257-11eb-961c-189803ef9db7.png)

![image](https://user-images.githubusercontent.com/57425658/102692596-b0c1a200-4257-11eb-9452-1123106684b2.png)

![image](https://user-images.githubusercontent.com/57425658/102692597-b3bc9280-4257-11eb-8071-f4b46c76a992.png)

#### paper DOI : 10.1109/GCCE46687.2019.9015294



2020년 4월 2일

2019년 여름부터 설계하고 실험한 데이터 및 매트랩 코드

총 37명의 피실험자, 각 G1:14, G2:14 G3: 9 

PTP 4 task에 관해서. 2d long and short, 3d long and short

- LINExxxx_xth.csv
각 날짜별, 순서별 환자 PTP의 VIVE 데이터

- MT_xxxx_xth.csv
각 날짜별, 순서별 환자 PTP의 XSENS 데이터

- Analysis_tool.m
LINE과 MT 데이터를 이용하여 데이터를 정리. 
exp_2d와 exp_3d데이터 스트럭쳐를 생성한다. 
이후 수작업으로 HCI_xth.mat 파일 생성

- After_processing.m
HCI_xth.mat을 사용하여 에러, 시간, 속도 파라미터들을 분석하고 MMSE점수와 매칭
자동으로 HCI_xth_afterprocessing.mat을 생성.

- curvefitting.m
HCI_xth_afterprocessing.mat 들을 G1 G2 G3 실험군으로 나눈다.
이 때 생성된 G1 G2 G3 struct를 수작업으로 Gx._HCI.mat으로 저장한다.

- ANOVA.m
Gx._HCI.mat 을 이용하여 ANOVA분석을 한다.

- CORREALATION.m 
Gx._HCI.mat 을 이용하여 상관관계분석을 한다.

- fitgauss2.m, gaussian.m 
Analysis_tool.m 에서 XSENS 속도 데이터를 gaussian fitting할 때 사용되는 함수
