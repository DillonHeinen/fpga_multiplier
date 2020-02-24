`timescale 1ns / 1ps

module bcd(
    input [3:0] sw,
    output [3:0] an,
    output [6:0] seg,
    output dp);
    
assign an = 4'b1110;      // activates final 7-seg display
assign dp = 1;            // deactivates the decimal point

                          // structural model
//wire a1w,a2w,a3w,a4w;     // a button
//and a1(a1w,~sw[3],~sw[2],~sw[1],sw[0]);
//and a2(a2w,~sw[3],sw[2],~sw[1],~sw[0]);
//and a3(a3w,sw[3],~sw[2],sw[1],sw[0]);
//and a4(a4w,sw[3],sw[2],~sw[1],sw[0]);
//or o1(seg[6],a1w,a2w,a3w,a4w);

//wire b1w,b2w,b3w,b4w;     // b button
//and b1(b1w,~sw[3],sw[2],~sw[1],sw[0]);
//and b2(b2w,sw[3],sw[1],sw[0]);
//and b3(b3w,sw[2],sw[1],~sw[0]);
//and b4(b4w,sw[3],sw[2],~sw[0]);
//or o2(seg[5],b1w,b2w,b3w,b4w);

//wire c1w,c2w,c3w;         // c button
//and c1(c1w,~sw[3],~sw[2],sw[1],~sw[0]);
//and c2(c2w,sw[3],sw[2],sw[1]);
//and c3(c3w,sw[3],sw[2],~sw[0]);
//or o3(seg[4],c1w,c2w,c3w);

//wire d1w,d2w,d3w,d4w;     // d button
//and d1(d1w,~sw[3],~sw[2],~sw[1],sw[0]);
//and d2(d2w,~sw[3],sw[2],~sw[1],~sw[0]);
//and d3(d3w,sw[3],~sw[2],sw[1],~sw[0]);
//and d4(d4w,sw[2],sw[1],sw[0]);
//or o4(seg[3],d1w,d2w,d3w,d4w);

//wire e1w,e2w,e3w;          // e button
//and e1(e1w,~sw[3],sw[0]);
//and e2(e2w,~sw[3],sw[2],~sw[1]);
//and e3(e3w,~sw[2],~sw[1],sw[0]);
//or o5(seg[2],e1w,e2w,e3w);

//wire f1w,f2w,f3w,f4w;      // f button
//and f1(f1w,sw[3],sw[2],~sw[1],sw[0]);
//and f2(f2w,~sw[3],~sw[2],sw[0]);
//and f3(f3w,~sw[3],~sw[2],sw[1]);
//and f4(f4w,~sw[3],sw[1],sw[0]);
//or o6(seg[1],f1w,f2w,f3w,f4w);

//wire g1w,g2w,g3w;              // g button
//and g1(g1w,~sw[3],~sw[2],~sw[1]);
//and g2(g2w,~sw[3],sw[2],sw[1],sw[0]);
//and g3(g3w,sw[3],sw[2],~sw[1],~sw[0]);
//or o7(seg[0],g1w,g2w,g3w);

                           // dataflow model
assign seg[6] = (~sw[3]&~sw[2]&~sw[1]&sw[0]) | (~sw[3]&sw[2]&~sw[1]&~sw[0]) | (sw[3]&~sw[2]&sw[1]&sw[0])  | (sw[3]&sw[2]&~sw[1]&sw[0]);
assign seg[5] = (~sw[3]&sw[2]&~sw[1]&sw[0])  | (sw[3]&sw[1]&sw[0])          | (sw[2]&sw[1]&~sw[0])        | (sw[3]&sw[2]&~sw[0]);
assign seg[4] = (~sw[3]&~sw[2]&sw[1]&~sw[0]) | (sw[3]&sw[2]&sw[1])          | (sw[3]&sw[2]&~sw[0]);
assign seg[3] = (~sw[3]&~sw[2]&~sw[1]&sw[0]) | (~sw[3]&sw[2]&~sw[1]&~sw[0]) | (sw[3]&~sw[2]&sw[1]&~sw[0]) | (sw[2]&sw[1]&sw[0]);
assign seg[2] = (~sw[3]&sw[0])               | (~sw[3]&sw[2]&~sw[1])        | (~sw[2]&~sw[1]&sw[0]);
assign seg[1] = (sw[3]&sw[2]&~sw[1]&sw[0])   | (~sw[3]&~sw[2]&sw[0])        | (~sw[3]&~sw[2]&sw[1])       | (~sw[3]&sw[1]&sw[0]);
assign seg[0] = (~sw[3]&~sw[2]&~sw[1])       | (~sw[3]&sw[2]&sw[1]&sw[0])   | (sw[3]&sw[2]&~sw[1]&~sw[0]);

                           // behavioral model
//    reg seg6=1,seg5=1,seg4=1,seg3=1,seg2=1,seg1=1,seg0=1;
//    assign seg[6] = seg6;
//    assign seg[5] = seg5;
//    assign seg[4] = seg4;
//    assign seg[3] = seg3;
//    assign seg[2] = seg2;
//    assign seg[1] = seg1;
//    assign seg[0] = seg0;
//    always @(*)
//    begin
//        case({sw[3],sw[2],sw[1],sw[0]})
//            4'b0000: begin
//                     seg6 = 0;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 0;
//                     seg2 = 0;
//                     seg1 = 0;
//                     seg0 = 1;
//                     end
//            4'b0001: begin
//                     seg6 = 1;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 1;
//                     seg2 = 1;
//                     seg1 = 1;
//                     seg0 = 1;
//                     end
//            4'b0010: begin
//                     seg6 = 0;
//                     seg5 = 0;
//                     seg4 = 1;
//                     seg3 = 0;
//                     seg2 = 0;
//                     seg1 = 1;
//                     seg0 = 0;
//                     end
//            4'b0011: begin
//                     seg6 = 0;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 0;
//                     seg2 = 1;
//                     seg1 = 1;
//                     seg0 = 0;
//                     end
//            4'b0100: begin
//                     seg6 = 1;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 1;
//                     seg2 = 1;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            4'b0101: begin
//                     seg6 = 0;
//                     seg5 = 1;
//                     seg4 = 0;
//                     seg3 = 0;
//                     seg2 = 1;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            4'b0110: begin
//                     seg6 = 0;
//                     seg5 = 1;
//                     seg4 = 0;
//                     seg3 = 0;
//                     seg2 = 0;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            4'b0111: begin
//                     seg6 = 0;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 1;
//                     seg2 = 1;
//                     seg1 = 1;
//                     seg0 = 1;
//                     end
//            4'b1000: begin
//                     seg6 = 0;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 0;
//                     seg2 = 0;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            4'b1001: begin
//                     seg6 = 0;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 0;
//                     seg2 = 1;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            4'b1010: begin
//                     seg6 = 0;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 1;
//                     seg2 = 0;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            4'b1011: begin
//                     seg6 = 1;
//                     seg5 = 1;
//                     seg4 = 0;
//                     seg3 = 0;
//                     seg2 = 0;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            4'b1100: begin
//                     seg6 = 0;
//                     seg5 = 1;
//                     seg4 = 1;
//                     seg3 = 0;
//                     seg2 = 0;
//                     seg1 = 0;
//                     seg0 = 1;
//                     end
//            4'b1101: begin
//                     seg6 = 1;
//                     seg5 = 0;
//                     seg4 = 0;
//                     seg3 = 0;
//                     seg2 = 0;
//                     seg1 = 1;
//                     seg0 = 0;
//                     end
//            4'b1110: begin
//                     seg6 = 0;
//                     seg5 = 1;
//                     seg4 = 1;
//                     seg3 = 0;
//                     seg2 = 0;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            4'b1111: begin
//                     seg6 = 0;
//                     seg5 = 1;
//                     seg4 = 1;
//                     seg3 = 1;
//                     seg2 = 0;
//                     seg1 = 0;
//                     seg0 = 0;
//                     end
//            default: begin
//                     seg6 = 1;
//                     seg5 = 1;
//                     seg4 = 1;
//                     seg3 = 1;
//                     seg2 = 1;
//                     seg1 = 1;
//                     seg0 = 1;
//                     end
//        endcase
//    end

endmodule
