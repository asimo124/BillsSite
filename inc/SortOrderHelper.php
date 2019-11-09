<?php

/**
 * @author AMH 2017.0303
 *
 * @class SortOrderHelper
 *
 * class used with datatables ajax pages to order by. it accepts
 * the request object,and an array of possible fields to sort by
 * which are usually the fields in the header row of your datatable
 * it returns an order by string to be used in a sql query
 */

/**
 * Class SortOrderHelper - class to build "order by" string, when recieve datatable request
 */
class SortOrderHelper
{
    function __construct() {

    }

    /**
     * @author AMH 2017.03.03
     *
     * @param $columns - array of columns that correspond to header fields in your datatable
     * @return string
     *
     * Receives array of cols which are header fields in datatable,
     * as well as request object passed in constructor, and returns
     * an "order by" string to be used by query in datatabase ajax action
     */
    public function getSortStr($columns, $requestArr) {

        # Accept either GET or POST
        $colArr = array();
        $dirArr = array();

        $order = $requestArr['order'];

        # Push into arrays for column and dir, in case multiple sorts are sent
        if (is_array($order)) {
            foreach ($order as $getOrder) {
                $colArr[] = $getOrder['column'];
                $dirArr[] = $getOrder['dir'];
            }
        }

        # Build order by string
        $orderby_str = "";
        foreach ($colArr as $i => $getCol) {
            if ($orderby_str == "") {
                $orderby_str = $columns[$getCol] . " " . $dirArr[$i];
            } else {
                $orderby_str .= ", " . $columns[$getCol] . " " . $dirArr[$i];
            }
        }
        return $orderby_str;
    }
}
?>