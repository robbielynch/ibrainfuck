__author__ = 'robbielynch'

from IPython.kernel.zmq.kernelbase import Kernel
from bfinterpreter.brainfuck import Brainy

class BrainfuckKernel(Kernel):
    implementation = 'brainfuck'
    implementation_version = '1.0'
    language = 'brainfuck'
    language_version = '0.1'
    language_info = {'mimetype': 'text/plain', 'name': 'brainfuck'}
    banner = "Brainfuck Kernel - it fucks with your brain"

    def do_execute(self, code, silent, store_history=True, user_expressions=None,
                   allow_stdin=False):
        if not silent:
            brainy = Brainy()
            brainy.eval(code)
            code_result = brainy.get_output()
            stream_content = {'name': 'stdout', 'text': code_result}
            self.send_response(self.iopub_socket, 'stream', stream_content)

        return {'status': 'ok',
                # The base class increments the execution count
                'execution_count': self.execution_count,
                'payload': [],
                'user_expressions': {},
               }

if __name__ == '__main__':
    from IPython.kernel.zmq.kernelapp import IPKernelApp
    IPKernelApp.launch_instance(kernel_class=BrainfuckKernel)
else:
    from IPython.kernel.zmq.kernelapp import IPKernelApp
    IPKernelApp.launch_instance(kernel_class=BrainfuckKernel)