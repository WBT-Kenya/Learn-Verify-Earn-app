mkdir ext2-test
cp compute-pub.key document document-tampered signature ext2-test/
genext2fs -b 1024 -d ext2-test dapp-data-test.ext2
e2ls dapp-data-test.ext2
cartesi-machine   --append-rom-bootargs="single=yes"   --flash-drive="label:dapp-data,filename:dapp-data-test.ext2"   -- $'date -s \'2100-01-01\' && gpg --trusted-key 0xA86D9CB964EB527E --import /mnt/dapp-data/compute-pub.key && gpg --verify /mnt/dapp-data/signature /mnt/dapp-data/document ; echo $?'
cartesi-machine   --append-rom-bootargs="single=yes"   --flash-drive="label:dapp-data,filename:dapp-data-test.ext2"   -- $'date -s \'2100-01-01\' && gpg --trusted-key 0xA86D9CB964EB527E --import /mnt/dapp-data/compute-pub.key && gpg --verify /mnt/dapp-data/signature /mnt/dapp-data/document-tampered ; echo $?'
exit
