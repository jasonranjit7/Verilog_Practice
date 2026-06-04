`include "../010_Half_Subtractor/design.v"
module full_sub(input x,
                input y,
                input bin,
                output diff,
                output bout);

  wire d1,bout1,bout2;

  half_sub sub_1(.x(x),
                 .y(y),
                 .bout(bout1),
                 .diff(d1));
  half_sub sub_2(.x(d1),
                 .y(bin),
                 .bout(bout2),
                 .diff(diff));

  or(bout,bout1,bout2);

endmodule
