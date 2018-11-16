//customer&building
    $(document).ready(function(){
        $("select#customer_select").change(function(){
            var customer_id = $(this).val();
            if (customer_id !== "")  {
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/interventions/building_by_customer/' + customer_id,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){ 
                        var building_select = $('select#building_select').empty();
                        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                        building_select.append(row);
                            $.each(data, function(i, j) {
                             row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                             building_select.append(row)
                            });
                    }
                });
            }
        })
    });

    //building&batteries
    $(document).ready(function(){
        $("select#building_select").change(function(){
            var building_id = $(this).val();
            if (building_id !== "")  {
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/interventions/battery_by_building/' + building_id,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){ 
                        console.log(data); 
                        var battery_select = $('select#battery_select').empty();
                        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                        battery_select.append(row)
                            $.each(data, function(i, j) {
                             row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                             battery_select.append(row)
                            });
                    }
                });
            }
        })
    });

    //batteries and column
    $(document).ready(function(){
        $("select#battery_select").change(function(){
            var battery_id = $(this).val();
            if (battery_id !== "")  {
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/interventions/column_by_battery/' + battery_id,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){ 
                        console.log(data);
                        var column_select = $('select#column_select').empty();
                        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                        column_select.append(row)
                            $.each(data, function(i, j) {
                             row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                             column_select.append(row)
                            });
                    }
                });
            }
        })
    });


    //column and elevator
    $(document).ready(function(){
        $("select#column_select").change(function(){
            var column_id = $(this).val();
            if (column_id !== "")  {
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/interventions/elevator_by_column/' + column_id,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){ 
                        console.log(data);     
                        var elevator_select = $('select#elevator_select').empty();
                        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                        elevator_select.append(row)
                            $.each(data, function(i, j) {
                             row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                             elevator_select.append(row)
                            });
                    }
                });
            }
        })
    });
