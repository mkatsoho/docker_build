export PYTHONPATH=$PYTHONPATH:/app/deps:/src/deps:./gen-py:./rpc

echo PYTHONPATH=$PYTHONPATH  2>&1 | tee -a ./logs/main.log
python3 -u main.py $*  2>&1 | tee -a ./logs/main.log


