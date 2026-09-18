module Traffic_Light(
    input  clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);

    // State Encoding
    localparam RED    = 2'b00;
    localparam GREEN  = 2'b01;
    localparam YELLOW = 2'b10;

    reg [1:0] current_state;
    reg [1:0] next_state;

    // 1-second counter for 50 MHz clock
    reg [25:0] counter;

    //==============================
    // State Register + Counter
    //==============================
    always @(posedge clk)
    begin
        if (!reset)                 // Active-LOW reset
        begin
            current_state <= RED;
            counter <= 26'd0;
        end
        else
        begin
            if (counter == 26'd49_999_999)
            begin
                counter <= 26'd0;
                current_state <= next_state;
            end
            else
            begin
                counter <= counter + 1'b1;
            end
        end
    end

    //==============================
    // Next-State Logic
    //==============================
    always @(*)
    begin
        case (current_state)

            RED:
                next_state = GREEN;

            GREEN:
                next_state = YELLOW;

            YELLOW:
                next_state = RED;

            default:
                next_state = RED;

        endcase
    end

    //==============================
    // Output Logic
    //==============================
    always @(*)
    begin
        red    = 1'b0;
        yellow = 1'b0;
        green  = 1'b0;

        case (current_state)

            RED:
                red = 1'b1;

            GREEN:
                green = 1'b1;

            YELLOW:
                yellow = 1'b1;

            default:
                red = 1'b1;

        endcase
    end

endmodule
