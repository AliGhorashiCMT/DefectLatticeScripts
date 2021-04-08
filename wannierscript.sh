for x in 2 3 4; do

export d="BC"
export y=$x$x
#mpirun -n 20 jdftx -i SG15BN$[y]BC.in | tee SG15BN$[y]BC.out
#mpirun -n 20 jdftx -i SG15BN$[y]BC.nscf.in | tee SG15BN$[y]BC.nscf.out

export mult=$x
export charge=-0.5
export defectband=$((mult*mult*4+1))
#jdftx_gpu -i BN_SCFALL.in | tee SG15BNSCF"$y""$d".out
wannier_gpu -i wannierall.in | tee wannierall"${y}""${d}".out
#jdftx_gpu -i BN_NSCFALL.in | tee SG15BNNSCF"$y""$d".out
#mpirun -n 20 jdftx -i BN_SCFALL.in | tee SG15BN"$y""$d".out
#mpirun -n 20 jdftx -i BN_NSCFALL.in | tee SG15BN"$y""$d".out

export d="NC"
export charge=0.5
export defectband=$((mult*mult*4-1))
wannier_gpu -i wannierall.in | tee wannierall"${y}""${d}".out
#jdftx_gpu -i BN_SCFALL.in | tee SG15BNSCF"$y""$d".out
#jdftx_gpu -i  BN_NSCFALL.in | tee SG15BNNSCF"$y""$d".out
#mpirun -n 20 jdftx -i BN_SCFALL.in | tee SG15BN"$y""$d".out
#mpirun -n 20 jdftx -i BN_NSCFALL.in | tee SG15BN"$y""$d".out

#mpirun -n 20 jdftx -i SG15BN$[y]NC.in | tee SG15BN$[y]NC.out
#mpirun -n 20 jdftx -i SG15BN$[y]NC.nscf.in | tee SG15BN$[y]NC.nscf.out
done

