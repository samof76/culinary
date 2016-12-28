# netdata Cookbook

This cookbook(alpha state) install netdata on Ubunut/Debian and configures it as a service.

Live demo: http://netdata.firehol.org
Github: https://github.com/firehol/netdata


## Requirements

The only requirement at the moment is an Ubuntu machine with Chef or Chef-Solo installed.

### Test On

Ubuntu 14.04 and CentOS 7
Chef-Solo 11.8.2

## Usage

#### netdata::default

Just include `netdata` in your node's `run_list`:

    {
      "name":"my_node",
      "run_list": [
        "recipe[netdata]"
      ]
    }

## License and Authors

    MIT License

    Copyright (c) 2016 Sambox LLP

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

Authors: samof76
