// TODO: remove this example!
package hello

import "testing"

func TestSayHello(t *testing.T) {
	tests := []struct {
		name string
		want string
	}{
		{
			name: "Basic function call",
			want: "Hello, world!",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := SayHello()
			if got != tt.want {
				t.Errorf("Got %s but wanted %s\n", got, tt.want)
			}
		})
	}
}
