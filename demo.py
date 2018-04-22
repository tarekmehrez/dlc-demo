import argparse
import sys

from flask import Flask


app = Flask(__name__)
parser = argparse.ArgumentParser()

parser.add_argument('--port',
                    dest='port',
                    type=int,
                    help='port to listen on')


@app.route('/v1/hello')
def hello_world():
    return 'Hello, Misho!'


if __name__ == "__main__":
    args = parser.parse_args()
    if not args.port:
        parser.print_help()
        sys.exit(0)
    app.run(host='0.0.0.0', port=args.port)
