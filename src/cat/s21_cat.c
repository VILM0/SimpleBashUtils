#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int b;
  int n;
  int s;
  int v;
  int e;
  int t;
  int new_line;
  int line_number;
} Flags;

void pars_flag(int argc, char **argv, Flags *flags);
void read_arg(const char *filename, Flags *flags);
void out_file(FILE *fp, Flags *flags);

int main(int argc, char **argv) {
  Flags flags = {0};
  flags.new_line = 1;
  flags.line_number = 0;

  if (argc == 1) {
    fprintf(stderr, "Usage: %s [-bns] [-e|-t|-v|-E|-T] [files...]\n", argv[0]);
    return 1;
  }

  pars_flag(argc, argv, &flags);

  for (int i = optind; i < argc; i++) {
    // flags.new_line = 1;
    // flags.line_number = 0;
    read_arg(argv[i], &flags);
  }

  return 0;
}

void pars_flag(int argc, char **argv, Flags *flags) {
  struct option long_options[] = {{"number-nonblank", 0, NULL, 'b'},
                                  {"number", 0, NULL, 'n'},
                                  {"squeeze-blank", 0, NULL, 's'},
                                  {0, 0, 0, 0}};

  int opt;
  while ((opt = getopt_long(argc, argv, "bnsetET", long_options, NULL)) !=
         -1) {
    switch (opt) {
      case 'b':
        flags->b = 1;
        flags->n = 0;
        break;
      case 'n':
        if (!flags->b) {
          flags->n = 1;
        }
        break;
      case 's':
        flags->s = 1;
        break;
      case 'e':
        flags->v = 1;
        flags->e = 1;
        break;
      case 't':
        flags->v = 1;
        flags->t = 1;
        break;
      case 'E':
        flags->e = 1;
        break;
      case 'T':
        flags->t = 1;
        break;
      default:
        fprintf(stderr, "Usage: %s [-bns] [-e|-t|-v|-E|-T] [files...]\n",
                argv[0]);
        exit(1);
    }
  }
}

void read_arg(const char *filename, Flags *flags) {
  FILE *file = fopen(filename, "r");
  if (!file) {
    fprintf(stderr, "Error: Cannot open file \"%s\"\n", filename);
    return;
  }

  out_file(file, flags);

  fclose(file);
}

void out_file(FILE *fp, Flags *flags) {
  // int new_line = 1;     // Флаг новой строки
  char pr_ch = 0;       // Предыдущий символ
  char ch;              // Текущий символ

  while ((ch = fgetc(fp)) != EOF) {
    if (flags->s) {
      if (pr_ch == '\n' && ch == '\n') {
        putchar(ch);
        while ((ch = fgetc(fp)) == '\n') continue;
      }
      pr_ch = ch;
    }

    if (flags->b && flags->new_line && ch != '\n') {
      printf("%6d\t", ++(flags->line_number));
      flags->new_line = 0;
    }

    if (flags->n && flags->new_line) {
      printf("%6d\t", ++(flags->line_number));
      flags->new_line = 0;
    }

    if (flags->e && ch == '\n') {
      putchar('$');
    }

    if (flags->t && ch == '\t') {
      printf("^I");
      continue;
    }

    if (flags->v) {
      if (ch < 32 && ch != '\n' && ch != '\t') {
        printf("^%c", ch + 64);
        continue;
      } else if (ch == 127) {
        printf("^?");
        continue;
      }
    }

    putchar(ch);

    if (ch == '\n') {
      flags->new_line = 1;
    }
  }
}