# OpenTSDB Setup Cookbook

This cookbook installs OpenTSDB, a scalable time series database. And since OpenTSDB is dependent on HBase as its backend metrics store, the cookbook includes a recipe to install a standalone, HBase local setup. Of course to use it or not is upto you.

## Requirements

A CentOS 7 machine, running Chef-Zero, Chef-Client or Chef-Solo

## Tested?

Yes, on CentOS7. Ubuntu recipe is coming soon.

## opentsdb::default is not enough :)

Just include recipes in your node's `run_list`, as follows:

    {
      "name":"my_node",
      "run_list": [
        "recipe[opentsdb]",
        "recipe[opentsdb::hbase]",
        "recipe[opentsdb::install]",
        "recipe[opentsdb::configure]"
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
