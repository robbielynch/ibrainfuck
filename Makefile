ifeq ($(shell which python3),)
$(error Can't find Python 3 executable 'python3')
exit 1
endif

#########################################
# Common Variables
#########################################
NOTEBOOK_FOLDER=notebooks
PYTHON=$(shell which python3)
BFDIR=${shell pwd}

#########################################
# Python 3.4 Specific
#########################################
PY3=python3.4
PY3_VENV=./.venv-py3
PY3_VENV_BIN=$(PY3_VENV)/bin/$(PY3)

$(PY3_VENV_BIN):
	@virtualenv --python=$(PY3) $(PY3_VENV)

deps: $(PY3_VENV_BIN)
	@. $(PY3_VENV)/bin/activate && \
	pip install -r requirements.txt
	@echo "[BRAINFUCK KERNEL - MAKE]Creating brainfuck kernel in IPython kernel directory..."
	mkdir -p ~/.ipython/kernels/brainfuck/
	@echo '{"argv":["python","${BFDIR}/brainfuckkernel.py", "-f", "{connection_file}"],"display_name":"Brainfuck"}' > ~/.ipython/kernels/brainfuck/kernel.json

shell-base:
	@echo "Starting Brainfuck Console..."
	. $(PY3_VENV)/bin/activate && \
	ipython3 console --kernel brainfuck

bfshell:
	@make shell-base

bfshell-deps: deps shell-base

clean:
	rm -rf $(PY3_VENV)

demo:
	@echo "Starting IBrainfuck Notebook Demo..."
	@. $(PY3_VENV)/bin/activate && \
    cd ${BFDIR} && \
	ipython3 notebook $(NOTEBOOK_FOLDER)

demo-no-deps:
	@make demo

py3notebook: NOTEBOOK_FOLDER=notebooks
py3notebook: deps compile demo-base

bf-deps: deps demo
bf: demo
