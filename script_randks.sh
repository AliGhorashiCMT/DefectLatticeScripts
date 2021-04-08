for d in "NC" "BC"; do
for x in 2 3 4 5; do

export d
echo "The type of defect lattice is $d"
echo "Supercell mult is $x$x"
export y=$x$x
export mult=$x
#mpirun -n 20 jdftx -i SG15BN$[y]BC.in | tee SG15BN$[y]BC.out
#mpirun -n 20 jdftx -i SG15BN$[y]BC.nscf.in | tee SG15BN$[y]BC.nscf.out

#mpirun -n 40 jdftx -i BN_NSCFALL.in | tee SG15BN$[y]$[d].nscfall.out
mpirun -n 40 jdftx -i BN_NSCFALL.in | tee SG15BN"$y""$d".nscfall.out
#mpirun -n 20 jdftx -i SG15BN$[y]NC.in | tee SG15BN$[y]NC.out
#mpirun -n 20 jdftx -i SG15BN$[y]NC.nscf.in | tee SG15BN$[y]NC.nscf.out
#echo $d
done
done
