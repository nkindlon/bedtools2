BT=${BT-../../bin/bedtools}

check()
{
	if diff $1 $2; then
    	echo ok
	else
    	echo fail
	fi
}

###########################################################
#  Test defaults
############################################################
echo "    map.t01...\c"
echo \
"chr1	0	100	30
chr1	100	200	1
chr2	0	100	.
chr2	100	200	.
chr3	0	100	6
chr3	100	200	4" > exp
$BT map -a ivls.bed -b values.bed > obs
check obs exp
rm obs exp

###########################################################
#  Test sum
############################################################
echo "    map.t02...\c"
echo \
"chr1	0	100	30
chr1	100	200	1
chr2	0	100	.
chr2	100	200	.
chr3	0	100	6
chr3	100	200	4" > exp
$BT map -a ivls.bed -b values.bed -o sum > obs
check obs exp
rm obs exp


###########################################################
#  Test count
############################################################
echo "    map.t03...\c"
echo \
"chr1	0	100	3
chr1	100	200	1
chr2	0	100	0
chr2	100	200	0
chr3	0	100	3
chr3	100	200	1" > exp
$BT map -a ivls.bed -b values.bed -o count > obs
check obs exp
rm obs exp


###########################################################
#  Test mean
############################################################
echo "    map.t04...\c"
echo \
"chr1	0	100	10
chr1	100	200	1
chr2	0	100	.
chr2	100	200	.
chr3	0	100	2
chr3	100	200	4" > exp
$BT map -a ivls.bed -b values.bed -o mean > obs
check obs exp
rm obs exp

###########################################################
#  Test max
############################################################
echo "    map.t05...\c"
echo \
"chr1	0	100	15
chr1	100	200	1
chr2	0	100	.
chr2	100	200	.
chr3	0	100	3
chr3	100	200	4" > exp
$BT map -a ivls.bed -b values.bed -o max > obs
check obs exp
rm obs exp

###########################################################
#  Test min
############################################################
echo "    map.t06...\c"
echo \
"chr1	0	100	5
chr1	100	200	1
chr2	0	100	.
chr2	100	200	.
chr3	0	100	1
chr3	100	200	4" > exp
$BT map -a ivls.bed -b values.bed -o min > obs
check obs exp
rm obs exp

###########################################################
#  Test mode
############################################################
echo "    map.t07...\c"
echo \
"chr1	0	100	5
chr1	100	200	1
chr2	0	100	.
chr2	100	200	.
chr3	0	100	1
chr3	100	200	4" > exp
$BT map -a ivls.bed -b values2.bed -o mode > obs
check obs exp
rm obs exp

###########################################################
#  Test anti-mode
############################################################
echo "    map.t08...\c"
echo \
"chr1	0	100	10
chr1	100	200	1
chr2	0	100	.
chr2	100	200	.
chr3	0	100	1
chr3	100	200	4" > exp
$BT map -a ivls.bed -b values2.bed -o antimode > obs
check obs exp
rm obs exp


###########################################################
#  Test column extraction from BEDPLUS
############################################################
echo "    map.t09...\c"
echo \
"chr1	0	100	1,2,3,4,5,-6
chr1	100	200	7
chr2	0	100	.
chr2	100	200	.
chr3	0	100	8,9,-10
chr3	100	200	11,12" > exp
$BT map -a ivls.bed -b values4.bed -c 7 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test min
############################################################
echo "    map.t10...\c"
echo \
"chr1	0	100	-6
chr1	100	200	7
chr2	0	100	.
chr2	100	200	.
chr3	0	100	-10
chr3	100	200	11" > exp
$BT map -a ivls.bed -b values4.bed -c 7 -o min > obs
check obs exp
rm obs exp

###########################################################
#  Test absmin
############################################################
echo "    map.t11...\c"
echo \
"chr1	0	100	1
chr1	100	200	7
chr2	0	100	.
chr2	100	200	.
chr3	0	100	8
chr3	100	200	11" > exp
$BT map -a ivls.bed -b values4.bed -c 7 -o absmin > obs
check obs exp
rm obs exp

###########################################################
#  Test max
############################################################
echo "    map.t12...\c"
echo \
"chr1	0	100	5
chr1	100	200	7
chr2	0	100	.
chr2	100	200	.
chr3	0	100	9
chr3	100	200	12" > exp
$BT map -a ivls.bed -b values4.bed -c 7 -o max > obs
check obs exp
rm obs exp

###########################################################
#  Test absmax
############################################################
echo "    map.t13...\c"
echo \
"chr1	0	100	6
chr1	100	200	7
chr2	0	100	.
chr2	100	200	.
chr3	0	100	10
chr3	100	200	12" > exp
$BT map -a ivls.bed -b values4.bed -c 7 -o absmax > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t14...\c"
echo \
"chr1	0	100	chr1,chr1,chr1,chr1,chr1
chr1	100	200	chr1
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 1 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t15...\c"
echo \
"chr1	0	100	hg19_ccdsGene,hg19_ccdsGene,hg19_ccdsGene,hg19_ccdsGene,hg19_ccdsGene
chr1	100	200	hg19_ccdsGene
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 2 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t16...\c"
echo \
"chr1	0	100	start_codon,CDS,exon,CDS,exon
chr1	100	200	exon
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 3 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t17...\c"
echo \
"chr1	0	100	1,2,8,9,40
chr1	100	200	40
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 4 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t18...\c"
echo \
"chr1	0	100	9,11,20,17,200
chr1	100	200	200
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 5 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t19...\c"
echo \
"chr1	0	100	0.000000,0.000000,0.000000,0.000000,0.000000
chr1	100	200	0.000000
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 6 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t20...\c"
echo \
"chr1	0	100	+,+,+,+,+
chr1	100	200	+
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 7 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t21...\c"
echo \
"chr1	0	100	.,0,.,2,.
chr1	100	200	.
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 8 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test GFF column extraction
############################################################
echo "    map.t22..\c"
echo \
"chr1	0	100	gene_id \"CCDS30744.1\"; transcript_id \"CCDS30744.1\";,gene_id \"CCDS30744.1\"; transcript_id \"CCDS30744.1\";,gene_id \"CCDS30744.1\"; transcript_id \"CCDS30744.1\";,gene_id \"CCDS30744.1\"; transcript_id \"CCDS30744.1\";,gene_id \"CCDS30744.1\"; transcript_id \"CCDS30744.1\";
chr1	100	200	gene_id \"CCDS30744.1\"; transcript_id \"CCDS30744.1\";
chr2	0	100	.
chr2	100	200	.
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.gff -c 9 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t23..\c"
echo \
"chr1	0	100	chr1,chr1,chr1
chr1	100	200	chr1,chr1
chr2	0	100	.
chr2	100	200	chr2,chr2
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 1 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t24..\c"
echo \
"chr1	0	100	10,15,20
chr1	100	200	110,130
chr2	0	100	.
chr2	100	200	110,130
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 2 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t25..\c"
echo \
"chr1	0	100	rs6054257,.,rs6040355
chr1	100	200	.,microsat1
chr2	0	100	.
chr2	100	200	.,microsat1
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 3 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t26..\c"
echo \
"chr1	0	100	G,T,A
chr1	100	200	T,GTC
chr2	0	100	.
chr2	100	200	T,GTC
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 4 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t27..\c"
echo \
"chr1	0	100	A,A,G,T
chr1	100	200	.,G,GTCT
chr2	0	100	.
chr2	100	200	.,G,GTCT
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 5 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t28..\c"
echo \
"chr1	0	100	29,3,67
chr1	100	200	47,50
chr2	0	100	.
chr2	100	200	47,50
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 6 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t29..\c"
echo \
"chr1	0	100	PASS,q10,PASS
chr1	100	200	PASS,PASS
chr2	0	100	.
chr2	100	200	PASS,PASS
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 7 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t30..\c"
echo \
"chr1	0	100	NS=3;DP=14;AF=0.5;DB;H2,NS=3;DP=11;AF=0.017,NS=2;DP=10;AF=0.333,0.667;AA=T;DB
chr1	100	200	NS=3;DP=13;AA=T,NS=3;DP=9;AA=G
chr2	0	100	.
chr2	100	200	NS=3;DP=13;AA=T,NS=3;DP=9;AA=G
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 8 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t31..\c"
echo \
"chr1	0	100	GT:GQ:DP:HQ,GT:GQ:DP:HQ,GT:GQ:DP:HQ
chr1	100	200	GT:GQ:DP:HQ,GT:GQ:DP
chr2	0	100	.
chr2	100	200	GT:GQ:DP:HQ,GT:GQ:DP
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 9 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t32..\c"
echo \
"chr1	0	100	0|0:48:1:51,51,0|0:49:3:58,50,1|2:21:6:23,27
chr1	100	200	0|0:54:7:56,60,0/1:35:4
chr2	0	100	.
chr2	100	200	0|0:54:7:56,60,0/1:35:4
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -c 10 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test VCF column extraction
############################################################
echo "    map.t33..\c"
echo \
"
*****
*****ERROR: requested column 15 , but record only has fields 1 - 12. Exiting.

*****" > exp
$BT map -a ivls.bed -b test.vcf -c 15 -o collapse 2> obs
check obs exp
rm obs exp

###########################################################
#  Test -header
############################################################
echo "    map.t33..\c"
echo \
"#header
chr1	0	100	0|0:48:1:51,51,0|0:49:3:58,50,1|2:21:6:23,27
chr1	100	200	0|0:54:7:56,60,0/1:35:4
chr2	0	100	.
chr2	100	200	0|0:54:7:56,60,0/1:35:4
chr3	0	100	.
chr3	100	200	." > exp
$BT map -a ivls.bed -b test.vcf -header -c 10 -o collapse > obs
check obs exp
rm obs exp

###########################################################
#  Test -null
############################################################
echo "    map.t33..\c"
echo \
"chr1	0	100	0|0:48:1:51,51,0|0:49:3:58,50,1|2:21:6:23,27
chr1	100	200	0|0:54:7:56,60,0/1:35:4
chr2	0	100	NULL
chr2	100	200	0|0:54:7:56,60,0/1:35:4
chr3	0	100	NULL
chr3	100	200	NULL" > exp
$BT map -a ivls.bed -b test.vcf -null NULL -c 10 -o collapse > obs
check obs exp

###########################################################
#  Test -s
############################################################
echo "    map.t34..\c"
echo \
"chr1	0	10	a1	10	-	.
chr2	10	20	a7	2	+	.
chr3	120	130	a9	4	-	." > exp
$BT map -a ivls2.bed -b values.bed -c 4 -o collapse -s > obs
check obs exp

###########################################################
#  Test -S
############################################################
echo "    map.t35..\c"
echo \
"chr1	0	10	a1	10	-	a1
chr2	10	20	a7	2	+	.
chr3	120	130	a9	4	-	a8" > exp
$BT map -a ivls2.bed -b values.bed -c 4 -o collapse -S > obs
check obs exp

###########################################################
#  Test -f 0.1
############################################################
echo "    map.t36..\c"
echo \
"chr1	0	10	a1	10	-	a1
chr2	10	20	a7	2	+	.
chr3	120	130	a9	4	-	a8" > exp
$BT map -a ivls2.bed -b values5.bed -c 4 -o collapse -f 0.1 > obs
check obs exp

###########################################################
#  Test -f 0.7
############################################################
echo "    map.t37..\c"
echo \
"chr1	0	10	a1	10	-	.
chr2	10	20	a7	2	+	.
chr3	120	130	a9	4	-	a8" > exp
$BT map -a ivls2.bed -b values5.bed -c 4 -o collapse -f 0.7 > obs
check obs exp

###########################################################
#  Test -f 0.9
############################################################
echo "    map.t38..\c"
echo \
"chr1	0	10	a1	10	-	.
chr2	10	20	a7	2	+	.
chr3	120	130	a9	4	-	." > exp
$BT map -a ivls2.bed -b values5.bed -c 4 -o collapse -f 0.9 > obs
check obs exp

###########################################################
#  Test -g
############################################################
echo "    map.t39..\c"
echo \
"chr1	10	20	chr1
chr2	10	20	chr2
chr2	200	300	.
chr10	10	20	.
chr10	20	30	." > exp
$BT map -a a.vsorted.bed -b b.vsorted.bed -c 1 -o collapse > obs
check obs exp

###########################################################
#  Test -g
############################################################
echo "    map.t40..\c"
echo \
"chr1	10	20	chr1
chr2	10	20	chr2
chr2	200	300	.
chr10	10	20	chr10
chr10	20	30	." > exp
$BT map -g genome -a a.vsorted.bed -b b.vsorted.bed -c 1 -o collapse > obs
check obs exp

rm obs exp
