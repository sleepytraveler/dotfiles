#!/bin/sh

rsync -a --progress \
--exclude '.ccache' --exclude '.cache' --exclude 'node_modules' \
--exclude '.npm' --exclude '.oracle_jre_usage' --exclude 'rpmbuild' \
--exclude '.yarn' --exclude "*.o" --exclude "*.ko" \
--exclude "*.o.cmd" --exclude "*.ko.cmd" --exclude "*.log" \
--exclude "*.VC.db*" --exclude "/home/vrkonda/.config/Code/logs/*" \
--exclude "*.buildroot-ccache*" --exclude "*buildroot/output/" \
--delete \
/home/vrkonda/ /mnt/storage/backup/home_vrkonda/
