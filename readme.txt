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