const std = @import("std");

pub fn main() !void { // can return an error
        var stdout_buffer: [1024]u8 = undefined;
        var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
        const stdout = &stdout_writer.interface;

        var stdin_buffer: [1024]u8 = undefined;
        var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
        const stdin = &stdin_reader.interface;

	try stdout.print("***************************\n", .{}); // always expects formatted strings
	try stdout.print("A SIMPLE CALCULATOR IN ZIG\n", .{});
	try stdout.writeAll("***************************\n"); // writeAll doesn't require formatting
        try stdout.flush(); // force sends everything in the current buffer to the terminal

        while (true) {
            try stdout.writeAll("Enter an option (+, -, *, /) | 'q' to quit: ");
            try stdout.flush();

            const option_input = stdin.takeDelimiter('\n') catch break; // get length + crash on error
            if (option_input == null) break;
            const option_line = option_input.?;
            if (option_line.len == 0) continue;
            const option = option_line[0];

            if (option == 'q' or option == 'Q') break;

            const num1 = getNumber(stdout, stdin, "Enter number 1 (double): ") orelse continue; // continue on error
            const num2 = getNumber(stdout, stdin, "Enter number 2 (double): ") orelse continue;

            const total: ?f64 = switch (option) {
                '+' => num1 + num2,
                '-' => num1 - num2,
                '*' => num1 * num2,
                '/' => num1 / num2,
                else => null,
            };

            if (total) |t| { // capture to extract inner value of total since it's an optional float
                try stdout.print("The result is {d}\n", .{t});
            }
            try stdout.flush();
        }
}

fn getNumber(stdout: *std.Io.Writer, stdin: *std.Io.Reader, message: []const u8) ?f64 {
    stdout.writeAll(message) catch return null;
    stdout.flush() catch return null;
    const line_opt = stdin.takeDelimiter('\n') catch return null;
    if (line_opt == null) return null;
    return std.fmt.parseFloat(f64, line_opt.?) catch null;
}
