CentOS 6.8 x86_64 用

* [CentOS 5.11 x86_64 用](https://github.com/tukiyo/php5.1-enable-zend-multibyte)
* [CentOS 6.8 x86_64 用](https://github.com/tukiyo/php5.3-enable-zend-multibyte)
* [srpmでSPECファイル編集してrpm作ってみた - Qiita](http://qiita.com/tukiyo3/items/77c912c6b4e3b8614852)

## php-5.3.3-47.el6.src.rpm

* http://vault.centos.org/6.8/os/Source/SPackages/php-5.3.3-47.el6.src.rpm


## make test

```ruby
TEST RESULT SUMMARY
---------------------------------------------------------------------
Exts skipped    :   52
Exts tested     :   26
---------------------------------------------------------------------

Number of tests : 11213              6952
Tests skipped   : 4261 ( 38.0%) --------
Tests warned    :    1 (  0.0%) (  0.0%)
Tests failed    :   49 (  0.4%) (  0.7%)
Expected fail   :    7 (  0.1%) (  0.1%)
Tests passed    : 6895 ( 61.5%) ( 99.2%)
---------------------------------------------------------------------
Time taken      :  251 seconds
```

```ruby
FAILED TEST SUMMARY
---------------------------------------------------------------------
Testing php_egg_logo_guid() function [tests/basic/php_egg_logo_guid.phpt]
Testing declare statement with several type values [Zend/tests/declare_001.phpt]
unixtojd() [ext/calendar/tests/unixtojd.phpt]
timezone_abbreviations_list() tests [ext/date/tests/010.phpt]
Test DateTime::modify() function : usage variation - Passing unexpected values to first argument $modify. [ext/date/tests/DateTime_modify_variation1.phpt]
Bug #20382 [2] (strtotime ("Monday", $date) produces wrong result on DST changeover) [ext/date/tests/bug20382-2.phpt]
Bug #33414 [1] (Comprehensive list of incorrect days returned after strotime() / date() tests) [ext/date/tests/bug33414-1.phpt]
Bug #33415 [1] (Possibly invalid non-one-hour DST or timezone shifts) [ext/date/tests/bug33415-1.phpt]
Bug #33415 [2] (Possibly invalid non-one-hour DST or timezone shifts) [ext/date/tests/bug33415-2.phpt]
Bug #33532 (Different output for strftime() and date()) [ext/date/tests/bug33532.phpt]
Bug #48187 (DateTime::diff() corrupting microtime() result) [ext/date/tests/bug48187.phpt]
Bug #51819 (Case discrepancy in timezone names cause Uncaught exception and fatal error) [ext/date/tests/bug51819.phpt]
Bug #51994 (date_parse_from_format is parsing invalid date using 'yz' format) [ext/date/tests/bug51994.phpt]
Bug #52290 (setDate, setISODate, setTime works wrong when DateTime created from timestamp) [ext/date/tests/bug52290.phpt]
Test date_modify() function : usage variation - Passing unexpected values to second argument $format. [ext/date/tests/date_modify_variation2.phpt]
Test timezone_abbreviations_list() function : basic functionality [ext/date/tests/timezone_abbreviations_list_basic1.phpt]
timezone_location_get: Test that timezone_location_get returns a correct array of information [ext/date/tests/timezone_location_get.phpt]
gmp_gcdext() basic tests [ext/gmp/tests/022.phpt]
gmp_nextprime() [ext/gmp/tests/gmp_nextprime.phpt]
Bug #28382 (openssl_x509_parse extensions support) [ext/openssl/tests/bug28382.phpt]
Bug #47828 (segfaults when a UTF-8 conversion fails openssl_x509_parse()) [ext/openssl/tests/bug47828.phpt]
openssl_x509_parse() basic test [ext/openssl/tests/openssl_x509_parse_basic.phpt]
ReflectionClass::getConstructor() [ext/reflection/tests/ReflectionClass_getConstructor_basic.phpt]
ReflectionMethod::isConstructor() [ext/reflection/tests/ReflectionMethod_constructor_basic.phpt]
ReflectionObject::getConstructor() - basic function test [ext/reflection/tests/ReflectionObject_getConstructor_basic.phpt]
a script should not be able to modify session.use_trans_sid [ext/session/tests/014.phpt]
use_trans_sid should not affect SID [ext/session/tests/015.phpt]
rewriter correctly handles attribute names which contain dashes [ext/session/tests/018.phpt]
rewriter uses arg_seperator.output for modifying URLs [ext/session/tests/020.phpt]
rewriter handles form and fieldset tags correctly [ext/session/tests/021.phpt]
Bug #31454 (Incorrect adding PHPSESSID to links, which contains \r\n) [ext/session/tests/bug36459.phpt]
Bug #41600 (url rewriter tags doesn't work with namespaced tags) [ext/session/tests/bug41600.phpt]
Test session_encode() function : error functionality [ext/session/tests/session_encode_error2.phpt]
SimpleXML: XPath [ext/simplexml/tests/008.phpt]
Bug #51615 (PHP crash with wrong HTML in SimpleXML) [ext/simplexml/tests/bug51615.phpt]
ext/sockets - socket_strerror - basic test [ext/sockets/tests/socket_strerror.phpt]
Test copy() function: usage variations - destination file names(empty string, nulls & bools) [ext/standard/tests/file/copy_variation4.phpt]
Test file_put_contents() function : usage variation - obscure filenames [ext/standard/tests/file/file_put_contents_variation8.phpt]
Test fscanf() function: usage variations - unsigned int formats with integer values [ext/standard/tests/file/fscanf_variation39.phpt]
Test fscanf() function: usage variations - tracking file pointer while reading [ext/standard/tests/file/fscanf_variation55.phpt]
Test lstat() and stat() functions: usage variations - effects of touch() on link [ext/standard/tests/file/lstat_stat_variation6.phpt]
Test readfile() function : variation - various invalid paths [ext/standard/tests/file/readfile_variation10.phpt]
Bug #44394 (Last two bytes missing from output) with session.use_trans_id [ext/standard/tests/general_functions/bug44394_2.phpt]
Test uniqid() function : basic functionality [ext/standard/tests/general_functions/uniqid_basic.phpt]
time_sleep_until() function - basic test for time_sleep_until() [ext/standard/tests/misc/time_sleep_until_basic.phpt]
getmxrr() test [ext/standard/tests/network/getmxrr.phpt]
htmlentities() / html_entity_decode() #8592 - #9002 table test [ext/standard/tests/strings/htmlentities17.phpt]
Test sscanf() function : basic functionality - unsigned format [ext/standard/tests/strings/sscanf_basic6.phpt]
Bug #32001 (xml_parse*() goes into infinite loop when autodetection in effect), using UTF-* [ext/xml/tests/bug32001.phpt]
```
