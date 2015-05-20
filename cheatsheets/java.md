Java
====
Read a resource
---------------
[source](http://www.mkyong.com/java/java-read-a-file-from-resources-folder/)

Iterate a map
-------------

    Map<String, String> myMap = ...;
    for(Map.Entry<String, String> entry : myMap.getEntrySet()) {
        System.out.println(entry.getKey() + " => " + entry.getValue());
    }
